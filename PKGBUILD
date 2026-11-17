# Maintainer: bull <bull@local>
# Contributor: Antigravity MTT S30 Team

pkgname=mtgpu-s30-userland
pkgver=3.1.0
pkgrel=6
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
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'libksysguard'
    'qt6-base'
)
optdepends=(
    'libva: hardware video acceleration (VA-API)'
    'clinfo: OpenCL platform query'
    'libnotify: desktop alerts when entering safe fallback graphics mode'
)
provides=('vulkan-driver')
conflicts=('mtgpu-userland')
options=('!strip' '!debug')
source=(
    "musa_3.1.0-pc_x86.deb::https://github.com/cont1nu1ty/mtt-s30-arch/releases/download/v3.1.0/musa_3.1.0-pc_x86.deb"
    'repair-mtgpu-dri.py'
    "libEGL_mesa.so.0::https://github.com/cont1nu1ty/mtt-s30-arch/releases/download/v3.1.0/libEGL_mesa.so.0"
    "libglapi.so.0::https://github.com/cont1nu1ty/mtt-s30-arch/releases/download/v3.1.0/libglapi.so.0"
    '00_mtgpu.json'
    '50_mtt_mesa.json'
    'musaicdconf.json'
    '70-mtgpu.rules'
    'chromium-flags.conf'
    'ksystemstats-plugin.tar.gz'
    'mtgpu-guards.tar.gz'
    'mtgpu-env-probe'
    '20-mtt-s30-env-generator'
    '20-mtt-s30-unit-generator'
    'mtgpu-fallback-notify'
    'mtgpu-fallback-notify.desktop'
    'mtgpu-ctl'
)
noextract=("musa_3.1.0-pc_x86.deb")
sha256sums=('04c286ba452fe0cfbea2c47465f0c48b0659c09b896f05f363feba680dd8efda'
            '7a42ba27ef3a03d277f73c80aaa3c190a6215dcc30dfd67b6330d59800939a0d'
            'c39f1838e97a1e05e851ddc1f7dba0e68b44d04327701c1c26301ba2f89c2a6f'
            'cbc7737f218356ae47be277105708e9d72db6b07df79f19def55fb7ed700761e'
            '291cf1f6bde70b6a407fe8ca646979feb07bc7d4183335560254eb6b2d6bf3f5'
            'a675353f7c0b64ab31b26ad206113015329a1d81ebdc41909e17490bea44871c'
            '7a352303892a9f4489dfc283aebda7d4d69ef94740591e3c233cd9ac4ef4eeef'
            '0435a924991e6e0a4e75f4fd9534195c5927026766bad3863de515bffdc05be8'
            '434c9f3309436f92abd3a8b02a4a128e13883ca8b12d146931db5925a91bb6d9'
            '11716f9be8035f185aa4a5ac8fac71bc3bc3fb6e2e13ab0986ec37a4a9c712cb'
            '103860ef433a1198b3df31f050f7403ac1fbc9024f0d9998cc6c40d1457c2c44'
            'd75046f39628fbbe72df4763ef3b9f5a3bcba479a1e08c74561b7bf8d560611c'
            '8872d65ea147f6d9b684f3e814344460d832a6078c3424ad840c7a916b19ac41'
            '4cd34098ddca9ff773533d5fc41134cf7347de0f455debe72017ebbe280ab215'
            'add2149912e2c83bdb1671ba1eca9260988eb8c2ecbb8c77ed9a511758e865dd'
            'd716390014d923fb9a292dce9596d8b43967712f216b348001930832d140e935'
            'cbc9b4b4239d26a812d39e6df2e9d61873fcada7da44c5211a26834f940cf4f6')

prepare() {
    rm -rf "$srcdir/deb-data"
    mkdir -p "$srcdir/deb-data"
    bsdtar -xOf "$srcdir/musa_3.1.0-pc_x86.deb" data.tar.xz |
        bsdtar -xf - -C "$srcdir/deb-data"

    # Repair WaylandSwapChain destructor double-free in-place
    python3 "$srcdir/repair-mtgpu-dri.py" \
        "$srcdir/deb-data/usr/lib/x86_64-linux-gnu/dri/mtgpu_dri.so"
}

build() {
    cmake -B "$srcdir/build-ksys" -S "$srcdir/ksystemstats-plugin" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF
    cmake --build "$srcdir/build-ksys"

    make -C "$srcdir/mtgpu-guards"
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

    # 4. Mesa EGL compatibility bridge & hardware-gated runtime guards
    install -d "$pkgdir/usr/lib/mthreads/egl"
    install -m755 "$srcdir/libEGL_mesa.so.0" "$pkgdir/usr/lib/mthreads/egl/"
    install -m755 "$srcdir/libglapi.so.0" "$pkgdir/usr/lib/mthreads/egl/"
    ln -s libEGL_mesa.so.0 "$pkgdir/usr/lib/mthreads/egl/libEGL_mesa.so"
    install -m755 "$srcdir/mtgpu-guards/libEGL_mtgpu_guard.so" "$pkgdir/usr/lib/mthreads/egl/"
    install -m755 "$srcdir/mtgpu-guards/libEGL_mtt_mesa_guard.so" "$pkgdir/usr/lib/mthreads/egl/"
    install -m755 "$srcdir/mtgpu-guards/libVK_MT_guard.so" "$pkgdir/usr/lib/mthreads/egl/"

    # 5. Guarded GLVND and Vulkan ICD registrations
    install -d "$pkgdir/usr/share/glvnd/egl_vendor.d"
    install -m644 "$srcdir/00_mtgpu.json" "$pkgdir/usr/share/glvnd/egl_vendor.d/"
    install -m644 "$srcdir/50_mtt_mesa.json" "$pkgdir/usr/share/glvnd/egl_vendor.d/"

    install -d "$pkgdir/usr/share/vulkan/icd.d"
    install -m644 "$srcdir/musaicdconf.json" "$pkgdir/usr/share/vulkan/icd.d/"

    # 6. Userland utilities & diagnostic CLI
    install -d "$pkgdir/usr/bin"
    install -m755 "$deb/usr/bin/mthreads-gmi" "$pkgdir/usr/bin/"
    install -m755 "$deb/usr/local/musa/bin/musaInfo" "$pkgdir/usr/bin/"
    install -m755 "$srcdir/mtgpu-ctl" "$pkgdir/usr/bin/mtgpu-ctl"

    # 7. MUSA SDK headers
    install -d "$pkgdir/usr/include"
    cp -r "$deb/usr/local/musa/include" "$pkgdir/usr/include/musa"

    # 8. Dynamic runtime probes, systemd user generators, browser flags & sysctl/modprobe/udev
    install -Dm755 "$srcdir/mtgpu-env-probe" "$pkgdir/usr/lib/mtgpu/mtgpu-env-probe"
    install -Dm755 "$srcdir/mtgpu-fallback-notify" "$pkgdir/usr/lib/mtgpu/mtgpu-fallback-notify"
    install -Dm755 "$srcdir/20-mtt-s30-env-generator" \
        "$pkgdir/usr/lib/systemd/user-environment-generators/20-mtt-s30"
    install -Dm755 "$srcdir/20-mtt-s30-unit-generator" \
        "$pkgdir/usr/lib/systemd/user-generators/20-mtt-s30"
    install -Dm644 "$srcdir/mtgpu-fallback-notify.desktop" \
        "$pkgdir/etc/xdg/autostart/mtgpu-fallback-notify.desktop"

    install -d "$pkgdir/etc"
    install -m644 "$srcdir/chromium-flags.conf" "$pkgdir/etc/chromium-flags.conf"
    install -m644 "$srcdir/chromium-flags.conf" "$pkgdir/etc/chrome-flags.conf"

    install -d "$pkgdir/etc/modprobe.d"
    install -m644 "$deb/etc/modprobe.d/mtgpu.conf" "$pkgdir/etc/modprobe.d/"

    install -d "$pkgdir/etc/sysctl.d"
    install -m644 "$deb/etc/sysctl.d/99-musa.conf" "$pkgdir/etc/sysctl.d/"

    install -d "$pkgdir/usr/lib/udev/rules.d"
    install -m644 "$srcdir/70-mtgpu.rules" "$pkgdir/usr/lib/udev/rules.d/"

    # 9. KDE System Monitor GPU metrics plugin
    install -d "$pkgdir/usr/lib/mtgpu/plugins/ksystemstats"
    install -m755 "$srcdir/build-ksys/ksystemstats_plugin_gpu.so" \
        "$pkgdir/usr/lib/mtgpu/plugins/ksystemstats/"

    # 10. Upstream License
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$deb/usr/local/share/musa/License.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
