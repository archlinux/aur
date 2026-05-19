# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=greenboost-git
pkgver=2.8.2.r13.1bb976e
pkgrel=1
pkgdesc="CUDA memory orchestrator for NVIDIA GPUs — unified VRAM + System RAM + SSD pool (dev fork, fix/arch-compat branch)"
arch=('x86_64')
url="https://gitlab.com/evorster/greenboost"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git' 'vulkan-headers')
optdepends=(
    'cuda: for TurboQuant KV cache compression'
    'vulkan-icd-loader: for Vulkan implicit layer (gaming support)'
    'lib32-glibc: needed if 32-bit audit library is shipped (built automatically when multilib is present)'
)
provides=('greenboost')
conflicts=('greenboost')
install=greenboost-git.install
source=("git+${url}.git#branch=fix/arch-compat")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/greenboost"
    local _upstream
    _upstream=$(awk -F':= ' '/^GB_VERSION/{print $2; exit}' Makefile)
    printf "%s.r%s.%s" "$_upstream" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/greenboost"

    # Inject FULL RELRO into the Makefile's hardcoded linker recipes.
    # SHIM_LDFLAGS  → used by the shim target
    # COMMON_CFLAGS → used by audit/vulkan; -Wl, flags pass through to ld
    local _relro="-Wl,-z,relro -Wl,-z,now"

    # Build userspace libraries only.
    # The kernel module is built later by DKMS on the user's machine
    # (the Kbuild file handles DKMS's make -C ${kernel_source_dir} M=${build_dir} modules).
    msg2 "Building CUDA shim..."
    make shim \
        SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so \
        SHIM_LDFLAGS="-Wl,--gc-sections -Wl,--as-needed ${_relro}"

    msg2 "Building LD_AUDIT injector..."
    make audit \
        SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so \
        COMMON_CFLAGS="-march=native -mtune=native -O3 -funroll-loops -std=gnu11 -flto -fvisibility=hidden -ffunction-sections -fdata-sections -mavx2 ${_relro}"

    # 32-bit audit library — only builds if multilib is present;
    # ships in the package only when lib32-glibc is already installed.
    msg2 "Building 32-bit audit library (skipped if multilib missing)..."
    make audit32 SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so 2>/dev/null || true

    msg2 "Building Vulkan implicit layer..."
    make vulkan \
        COMMON_CFLAGS="-march=native -mtune=native -O3 -funroll-loops -std=gnu11 -flto -fvisibility=hidden -ffunction-sections -fdata-sections -mavx2 ${_relro}"

    # TurboQuant CUDA kernel — skip if nvcc is not installed
    msg2 "Building TurboQuant (skipped if CUDA toolkit not found)..."
    make tq 2>/dev/null || true
}

package() {
    cd "$srcdir/greenboost"

    # ── DKMS source tree (kernel module built on install) ──────────────
    # DKMS expects /usr/src/<PACKAGE_NAME>-<PACKAGE_VERSION>/
    # PACKAGE_NAME is "greenboost" (from dkms.conf), not the AUR pkgname.
    local _dkms_ver="$pkgver"
    local _dkms_dir="$pkgdir/usr/src/greenboost-${_dkms_ver}"
    install -dm755 "$_dkms_dir"
    install -m644 greenboost.c \
                   greenboost_ioctl.h \
                   Kbuild \
                   Makefile \
                   dkms.conf \
                   "$_dkms_dir/"
    cp -r features "$_dkms_dir/"

    # Patch dkms.conf PACKAGE_VERSION to match the computed $pkgver
    sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${_dkms_ver}\"/" \
        "$_dkms_dir/dkms.conf"

    # ── Userspace libraries ────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/lib"
    install -m755 libgreenboost_cuda.so   "$pkgdir/usr/lib/"
    install -m755 libgreenboost_audit.so  "$pkgdir/usr/lib/"
    install -m755 libVkLayer_greenboost.so "$pkgdir/usr/lib/"

    # 32-bit audit library (only present when multilib was available at build time)
    if [[ -f libgreenboost_audit32.so ]]; then
        install -dm755 "$pkgdir/usr/lib32"
        install -m755 libgreenboost_audit32.so \
            "$pkgdir/usr/lib32/libgreenboost_audit.so"
    fi

    # TurboQuant library
    if [[ -f lib/greenboost_tq/libgreenboost_tq.so ]]; then
        install -m755 lib/greenboost_tq/libgreenboost_tq.so "$pkgdir/usr/lib/"
    fi

    # ── Vulkan implicit layer manifest ─────────────────────────────────
    # Patch the hardcoded /usr/local/lib path to /usr/lib
    install -dm755 "$pkgdir/usr/share/vulkan/implicit_layer.d"
    sed 's|/usr/local/lib/libVkLayer_greenboost\.so|/usr/lib/libVkLayer_greenboost.so|' \
        VkLayer_greenboost.json \
        > "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_greenboost.json"

    # ── CLI wrapper ────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/greenboost-run" <<'WRAPEOF'
#!/bin/sh
# Wrap any command with GreenBoost's CUDA shim preloaded.
LD_PRELOAD="/usr/lib/libgreenboost_cuda.so" exec "$@"
WRAPEOF
    chmod 755 "$pkgdir/usr/bin/greenboost-run"

    # ── Version stamp for install hooks ────────────────────────────────
    install -dm755 "$pkgdir/usr/share/$pkgname"
    echo "$_dkms_ver" > "$pkgdir/usr/share/$pkgname/dkms-version"

    # ── Documentation ──────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/"
    # Install additional docs if present
    for doc in ARCHITECTURE.md DOCUMENTATION.md CONTAINER_VM_MODE.md \
               GREENBOOST_COMMANDS.md GREENBOOST_PROTON.md; do
        [[ -f "$doc" ]] && install -m644 "$doc" "$pkgdir/usr/share/doc/$pkgname/"
    done

    # ── udev rule (fix /dev/greenboost permissions) ──────────────────────
    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    cat > "$pkgdir/usr/lib/udev/rules.d/99-greenboost.rules" <<'RULEEOF'
SUBSYSTEM=="greenboost", MODE="0660", GROUP="video"
RULEEOF
    chmod 644 "$pkgdir/usr/lib/udev/rules.d/99-greenboost.rules"

    # ── License ────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
