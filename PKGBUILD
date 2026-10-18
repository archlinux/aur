# Maintainer: smesa
# AMD XDNA NPU driver + XRT plugin (git/main)

pkgname=amdxdna-git
pkgver=$(git ls-remote https://github.com/amd/xdna-driver.git refs/heads/main 2>/dev/null | cut -f1 | cut -c1-8)
pkgrel=1
pkgdesc="AMD XDNA NPU driver (DKMS) and XRT plugin for Linux (git/main)"
arch=('x86_64')
url="https://github.com/amd/xdna-driver/"
license=('Apache-2.0')
options=(!strip !debug)

provides=('amdxdna-driver' 'xrt-plugin-amdxdna' 'amdxdna')
replaces=('amdxdna' 'amdxdna-driver' 'xrt-plugin-amdxdna' 'amdxdna-driver-bin')
conflicts=('amdxdna')

depends=('dkms' 'linux-headers')
makedepends=(
    base-devel boost cmake curl dkms elfutils gcc gdb git
    json-glib libdrm libffi libjpeg-turbo libpng
    libtiff libyaml lm_sensors ncurses ocl-icd opencl-headers
    openssl pciutils perl pkgconf protobuf python python-pip
    rapidjson strace jq
)
install=amdxdna.install

_srcrepo='xdna-driver'
source=("git+https://github.com/amd/xdna-driver.git#branch=main"
        "fix-clang-sizeof-array-div.patch"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    local repo="${srcdir}/${_srcrepo}"
    cd "$repo"

    # git-lfs required for vtd submodule (may not be a pacman package)
    command -v git-lfs >/dev/null || { error "git-lfs not found. Install: pacman -S git-lfs"; return 1; }

    # Init submodules (use env vars for safe.directory to avoid --global)
    export GIT_CONFIG_COUNT=1
    export GIT_CONFIG_KEY_0=safe.directory
    export GIT_CONFIG_VALUE_0='*'
    git submodule update --init --recursive

    # Apply Clang compat patch
    if ! grep -qF "/(sizeof(*hipe))" "drivers/accel/amdxdna/aie4_ctx.c" 2>/dev/null; then
        patch -p1 < "${srcdir}/fix-clang-sizeof-array-div.patch"
    fi

    # Detect Clang kernel
    if grep -q "CONFIG_CC_IS_CLANG=y" \
        /usr/lib/modules/$(uname -r)/build/include/config/auto.conf 2>/dev/null; then
        export LLVM=1
        msg "Kernel built with Clang — exporting LLVM=1"
    fi
}

build() {
    local repo="${srcdir}/${_srcrepo}"

    # --- Build XRT (links against system boost) ---
    msg2 "Building XRT..."
    cd "${repo}/xrt/build"
    bash ./build.sh -npu -opt -noctest

    # --- Build XDNA driver + shim + firmware ---
    cd "$repo"

    # Sync firmware
    if [ -f "tools/sync_from_whence.py" ] && [ -f "tools/WHENCE" ]; then
        msg2 "Syncing NPU firmware..."
        python3 tools/sync_from_whence.py firmware \
            --whence tools/WHENCE \
            --out amdxdna_bins/firmware \
            --commit-file amdxdna_bins/firmware/.whence_commit \
            || msg "WARNING: firmware sync failed"
    fi

    # CMake
    local builddir="${repo}/Release"
    mkdir -p "$builddir"
    cd "$builddir"
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/opt/xilinx/xrt \
          -DSKIP_KMOD=0 \
          -DBUILD_VXDNA=1 \
          "$repo"

    make -j"$(nproc)" DESTDIR="$PWD" install
    make package || msg "WARNING: make package failed"
}

package() {
    local repo="${srcdir}/${_srcrepo}"
    local builddir="${repo}/Release"
    local xrt_built="${repo}/xrt/build/Release"
    local share_dir="${builddir}/opt/xilinx/xrt/share/amdxdna"
    local tarball="${builddir}/driver/amdxdna.tar.gz"
    [ -f "$tarball" ] || tarball="${share_dir}/amdxdna.tar.gz"
    [ -f "$tarball" ] || { error "amdxdna.tar.gz not found"; return 1; }

    # XRT base (xrt-smi, libs — built against current system boost)
    mkdir -p "$pkgdir/opt/xilinx/xrt"
    cp -a "$xrt_built/opt/xilinx/xrt/." "$pkgdir/opt/xilinx/xrt/"

    # XDNA plugin: shim libs + firmware + share data (overlays XRT)
    local cpack
    cpack=$(find "$builddir" -maxdepth 1 -name "xrt_plugin.*-${arch}-amdxdna.tar.gz" \
        -printf '%T@ %p\n' 2>/dev/null | sort -rn | head -1 | cut -d' ' -f2-)
    if [ -n "$cpack" ]; then
        tar -xzf "$cpack" -C "$pkgdir"
    else
        cp -a "$builddir/opt" "$pkgdir/"
        [ -d "$builddir/usr/lib/firmware" ] && cp -a "$builddir/usr/lib/firmware" "$pkgdir/usr/lib/"
    fi

    # DKMS source
    local dkms_dir="$pkgdir/usr/src/amdxdna-${pkgver}"
    install -Dm644 "${share_dir}/dkms.conf" "$dkms_dir/dkms.conf"
    install -Dm755 "${share_dir}/configure_kernel.sh" "$dkms_dir/configure_kernel.sh"
    tar -xzf "$tarball" -C "$dkms_dir"

    # System config
    install -Dm644 /dev/stdin "$pkgdir/etc/modules-load.d/amdxdna.conf" <<< "amdxdna"
    install -Dm644 /dev/stdin "$pkgdir/etc/udev/rules.d/99-amdxdna.rules" \
        <<< 'KERNEL=="accel*",DRIVERS=="amdxdna",MODE="0666"'
    install -Dm644 /dev/stdin "$pkgdir/etc/security/limits.d/99-amdxdna.conf" \
        <<< $'* soft memlock unlimited\n* hard memlock unlimited'
}
