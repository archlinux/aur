# Maintainer: taotieren <admin@taotieren.com>

pkgbase=magiskboot-git
pkgname=magiskboot-git
pkgver=26101.37.r2.gf5dfa8f0
pkgrel=1
pkgdesc="Magiskboot_ndk"
arch=(x86_64
      i686
      aarch64
      armv7h)
url="https://github.com/xiaoxindada/magiskboot_ndk_on_linux"
license=(' GPL-3.0')
provides=(${pkgbase%-git
            busybox})
conflicts=(${pkgbase%-git}
            busybox)
depends=(p7zip
        wget
        tar
        python3)
makedepends=(
#             rust
#             rust-src
            git
#             xz
#             lz4
#             bzip2
#             zlib
            )
optdepends=('android-tools: Android platform tools')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/^Magiskboot-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git pull --recurse-submodules
}

build() {
    cd "${srcdir}/${pkgname}"
    ./build.sh setup
}

package() {
    cd "${srcdir}/${pkgname}"

    if [ ${CARCH} = "x86_64" ]; then
        install -Dm755 out/$arch/busybox ${pkgdir}/usr/bin/busybox
        install -Dm755 out/$arch/magiskboot ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "aarch64" ]; then
        install -Dm755 out/arm64-v8a/busybox ${pkgdir}/usr/bin/busybox
        install -Dm755 out/arm64-v8a/magiskboot ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "i686" ]; then
        install -Dm755 out/x86/busybox ${pkgdir}/usr/bin/busybox
        install -Dm755 out/x86/magiskboot ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "armv7h" ]; then
        install -Dm755 out/armeabi-v7a/busybox ${pkgdir}/usr/bin/busybox
        install -Dm755 out/armeabi-v7a/magiskboot ${pkgdir}/usr/bin/magiskboot
    fi
}
