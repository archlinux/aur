# Maintainer: bull <bull@local>
# Contributor: Antigravity MTT S30 Team

pkgname=mtgpu-s30-userland
pkgver=3.1.0
pkgrel=1
pkgdesc='Moore Threads MTT S30 userland graphics and compute drivers (OpenGL, Vulkan, VA-API, MUSA)'
arch=('x86_64')
install='mtgpu-s30-userland.install'
url='https://github.com/cont1nu1ty/mtt-s30-arch'
license=('LicenseRef-MooreThreads' 'MIT' 'LGPL-2.1-or-later')
depends=(
    'libdrm'
    'libglvnd'
    'vulkan-icd-loader'
    'wayland'
    'spirv-tools'
    'libx11'
    'libxcb'
)
optdepends=(
    'libva: hardware video acceleration (VA-API)'
    'clinfo: OpenCL platform query'
)
provides=('vulkan-driver')
conflicts=('mtgpu-userland')
options=('!strip' '!debug')
source=(
    "musa_3.1.0-pc_x86.deb::https://github.com/cont1nu1ty/mtt-s30-arch/releases/download/v3.1.0/musa_3.1.0-pc_x86.deb"
    'repair-mtgpu-dri.py'
    "libEGL_mesa.so.0::https://github.com/cont1nu1ty/mtt-s30-arch/releases/download/v3.1.0/libEGL_mesa.so.0"
    "libglapi.so.0::https://github.com/cont1nu1ty/mtt-s30-arch/releases/download/v3.1.0/libglapi.so.0"
    '50_mtt_mesa.json'
    '10-mtt-s30.conf'
    '70-mtgpu.rules'
)
noextract=("musa_3.1.0-pc_x86.deb")
sha256sums=(
    '04c286ba452fe0cfbea2c47465f0c48b0659c09b896f05f363feba680dd8efda'
    '7a42ba27ef3a03d277f73c80aaa3c190a6215dcc30dfd67b6330d59800939a0d'
    'c39f1838e97a1e05e851ddc1f7dba0e68b44d04327701c1c26301ba2f89c2a6f'
    'cbc7737f218356ae47be277105708e9d72db6b07df79f19def55fb7ed700761e'
    'f5b45c307aff65303d72297184fd05900e83c7613772c0c04e0bfe62c23df7a9'
    '8dadb8be4c795d5f0865971fc657678a1b127146dcd8e1569653ccada524fdf2'
    '0435a924991e6e0a4e75f4fd9534195c5927026766bad3863de515bffdc05be8'
)

prepare() {
    rm -rf "$srcdir/deb-data"
    mkdir -p "$srcdir/deb-data"
    bsdtar -xOf "$srcdir/musa_3.1.0-pc_x86.deb" data.tar.xz |
        bsdtar -xf - -C "$srcdir/deb-data"

    # Repair WaylandSwapChain destructor double-free in-place
    python3 "$srcdir/repair-mtgpu-dri.py" \
        "$srcdir/deb-data/usr/lib/x86_64-linux-gnu/dri/mtgpu_dri.so"
}

package() {
    local deb="$srcdir/deb-data"

    # 1. Core userland shared libraries
    install -d "$pkgdir/usr/lib"
    find "$deb/usr/lib/x86_64-linux-gnu" -maxdepth 1 \( -type f -o -type l \) -name "*.so*" \
        -exec cp -P -t "$pkgdir/usr/lib" {} +

    # MUSA runtime libraries
    find "$deb/usr/local/musa/lib" -maxdepth 1 \( -type f -o -type l \) -name "*.so*" \
        -exec cp -P -t "$pkgdir/usr/lib" {} +

    # 2. DRI drivers
    install -d "$pkgdir/usr/lib/dri"
    find "$deb/usr/lib/x86_64-linux-gnu/dri" -maxdepth 1 \( -type f -o -type l \) -name "*.so*" \
        -exec cp -P -t "$pkgdir/usr/lib/dri" {} +

    # 3. GBM backend
    install -d "$pkgdir/usr/lib/gbm"
    find "$deb/usr/lib/x86_64-linux-gnu/gbm" -maxdepth 1 \( -type f -o -type l \) -name "*.so*" \
        -exec cp -P -t "$pkgdir/usr/lib/gbm" {} +

    # 4. Mesa EGL compatibility bridge
    install -d "$pkgdir/usr/lib/mthreads/egl"
    install -m755 "$srcdir/libEGL_mesa.so.0" "$pkgdir/usr/lib/mthreads/egl/"
    install -m755 "$srcdir/libglapi.so.0" "$pkgdir/usr/lib/mthreads/egl/"
    ln -s libEGL_mesa.so.0 "$pkgdir/usr/lib/mthreads/egl/libEGL_mesa.so"

    # 5. GLVND and Vulkan ICD registrations
    install -d "$pkgdir/usr/share/glvnd/egl_vendor.d"
    install -m644 "$deb/usr/share/glvnd/egl_vendor.d/00_mtgpu.json" \
        "$pkgdir/usr/share/glvnd/egl_vendor.d/"
    install -m644 "$srcdir/50_mtt_mesa.json" \
        "$pkgdir/usr/share/glvnd/egl_vendor.d/"

    install -d "$pkgdir/usr/share/vulkan/icd.d"
    install -m644 "$deb/etc/vulkan/icd.d/musaicdconf.json" \
        "$pkgdir/usr/share/vulkan/icd.d/"

    # 6. Userland utilities
    install -d "$pkgdir/usr/bin"
    install -m755 "$deb/usr/bin/mthreads-gmi" "$pkgdir/usr/bin/"
    install -m755 "$deb/usr/local/musa/bin/musaInfo" "$pkgdir/usr/bin/"

    # 7. MUSA SDK headers
    install -d "$pkgdir/usr/include"
    cp -r "$deb/usr/local/musa/include" "$pkgdir/usr/include/musa"

    # 8. Environment and sysctl/modprobe configuration
    install -d "$pkgdir/etc/environment.d"
    install -m644 "$srcdir/10-mtt-s30.conf" "$pkgdir/etc/environment.d/"

    install -d "$pkgdir/etc/modprobe.d"
    install -m644 "$deb/etc/modprobe.d/mtgpu.conf" "$pkgdir/etc/modprobe.d/"

    install -d "$pkgdir/etc/sysctl.d"
    install -m644 "$deb/etc/sysctl.d/99-musa.conf" "$pkgdir/etc/sysctl.d/"

    install -d "$pkgdir/usr/lib/udev/rules.d"
    install -m644 "$srcdir/70-mtgpu.rules" "$pkgdir/usr/lib/udev/rules.d/"

    # 9. Upstream License
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$deb/usr/local/share/musa/License.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
