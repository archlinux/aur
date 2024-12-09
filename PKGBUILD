# Maintainer: taotieren <admin@taotieren.com>

pkgbase=magiskboot-git
pkgname=magiskboot-git
pkgver=28001.73.r13.g6115b52
pkgrel=1
pkgdesc="Magiskboot_ndk"
arch=($CARCH)
url="https://github.com/xiaoxindada/magiskboot_ndk_on_linux"
license=('GPL-3.0-or-later')
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
depends=()
makedepends=(
    cargo
    git
    python
    python-wget
    tar)
optdepends=('android-tools: Android platform tools')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^Magiskboot-//g;s/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git pull --recurse-submodules
}

build() {
    cd "${srcdir}/${pkgname}"
    python ./build.py --build_binary
}

package() {
    cd "${srcdir}/${pkgname}"

    if [ ${CARCH} = "x86_64" ]; then
        install -Dm755 out/$arch/magiskboot ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "aarch64" ]; then
        install -Dm755 out/arm64-v8a/magiskboot ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "i686" ]; then
        install -Dm755 out/x86/magiskboot ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "armv7h" ]; then
        install -Dm755 out/armeabi-v7a/magiskboot ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "riscv64" ]; then
        install -Dm755 out/riscv64/magiskboot ${pkgdir}/usr/bin/magiskboot
    fi
}
