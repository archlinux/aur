# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=greenboost-git
pkgver=3.2.r45.157ee71
pkgrel=1
pkgdesc="CUDA memory orchestrator for NVIDIA GPUs — unified VRAM + System RAM + SSD pool"
arch=('x86_64')
url="https://gitlab.com/IsolatedOctopi/greenboost"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
optdepends=(
    'cuda: for TurboQuant KV cache compression'
    'lib32-glibc: needed if 32-bit audit library is shipped (built automatically when multilib is present)'
)
provides=('greenboost')
conflicts=('greenboost')
install=greenboost-git.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/greenboost"
    local _upstream
    _upstream=$(awk -F':= ' '/^GB_VERSION/{print $2; exit}' Makefile)
    printf "%s.r%s.%s" "$_upstream" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/greenboost"

    # Inject FULL RELRO into the Makefile's linker recipes.
    local _relro="-Wl,-z,relro -Wl,-z,now"

    # Build userspace libraries only.
    # The kernel module is built later by DKMS on the user's machine.
    msg2 "Building CUDA shim..."
    # -lzstd before --as-needed: the Makefile appends $(ZSTD_LIBS) at the end,
    # after --as-needed has been processed.  With LTO the NEEDED entry gets
    # dropped while undefined symbols remain, causing a runtime crash.
    make shim \
        SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so \
        SHIM_LDFLAGS="-Wl,--gc-sections -lzstd -Wl,--as-needed ${_relro}"

    msg2 "Building LD_AUDIT injector..."
    make audit \
        SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so

    # 32-bit audit library — only builds if multilib is present.
    msg2 "Building 32-bit audit library (skipped if multilib missing)..."
    make audit32 SHIM_INSTALL_PATH=/usr/lib/libgreenboost_cuda.so 2>/dev/null || true
}

package() {
    cd "$srcdir/greenboost"

    # ── DKMS source tree (kernel module built on install) ──────────────
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

    # Fix M=${build_dir} and suppress clang warning on -fprefetch-loop-arrays.
    #
    # M=${build_dir}: ${build_dir} is not a reliably exported DKMS variable — it
    # works on fresh source installs but fails after DKMS clean removes the build
    # tree.  Use real DKMS variables (${dkms_tree}, PACKAGE_NAME, PACKAGE_VERSION)
    # to construct the path deterministically.
    #
    # KCFLAGS=-Wno-error=ignored-optimization-argument: the upstream Kbuild uses
    # -Werror, which turns clang's ignored-optimization-argument warning (GCC-only
    # -fprefetch-loop-arrays) into a fatal error.
    sed -i \
        -e 's|M=\${build_dir}|M=\${dkms_tree}/${PACKAGE_NAME}/${PACKAGE_VERSION}/build|g' \
        -e '/^MAKE\[0\]=/ s/modules"/KCFLAGS=-Wno-error=ignored-optimization-argument &/' \
        "$_dkms_dir/dkms.conf"

    # ── Userspace libraries ────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/lib"
    install -m755 libgreenboost_cuda.so   "$pkgdir/usr/lib/"
    install -m755 libgreenboost_audit.so  "$pkgdir/usr/lib/"

    # 32-bit audit library (only present when multilib was available at build time)
    if [[ -f libgreenboost_audit32.so ]]; then
        install -dm755 "$pkgdir/usr/lib32"
        install -m755 libgreenboost_audit32.so \
            "$pkgdir/usr/lib32/libgreenboost_audit.so"
    fi

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
    for doc in ARCHITECTURE.md DOCUMENTATION.md CONTAINER_VM_MODE.md \
               GREENBOOST_COMMANDS.md GREENBOOST_PROTON.md; do
        [[ -f "$doc" ]] && install -m644 "$doc" "$pkgdir/usr/share/doc/$pkgname/"
    done

    # ── udev rule ──────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    cat > "$pkgdir/usr/lib/udev/rules.d/99-greenboost.rules" <<'RULEEOF'
SUBSYSTEM=="greenboost", MODE="0660", GROUP="video"
RULEEOF
    chmod 644 "$pkgdir/usr/lib/udev/rules.d/99-greenboost.rules"

    # ── License ────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
