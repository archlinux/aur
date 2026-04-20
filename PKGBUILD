# Maintainer: taotieren <admin@taotieren.com>

pkgbase=magiskboot-git
pkgname=magiskboot-git
pkgver=r170.56c02e4
pkgrel=1
pkgdesc="Official magiskboot form Magisk (topjohnwu) source code, use GitHub Actions to build everyday."
arch=($CARCH)
url="https://github.com/Uevo001/magiskboot-linux"
license=('GPL-3.0-or-later')
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
depends=()
makedepends=(
    git
)
optdepends=('android-tools: Android platform tools')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=(!debug !strip)

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^Magiskboot-//g;s/^magisk_bins-//g;s/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    if [ ${CARCH} = "x86_64" ]; then
        install -Dm755 x86_64/magiskboot -t ${pkgdir}/usr/bin/
    elif [ ${CARCH} = "aarch64" ]; then
        install -Dm755 arm64-v8a/magiskboot -t ${pkgdir}/usr/bin/
    elif [ ${CARCH} = "i686" ]; then
        install -Dm755 x86/magiskboot -t ${pkgdir}/usr/bin/
    elif [ ${CARCH} = "armv7h" ]; then
        install -Dm755 armeabi-v7a/magiskboot -t ${pkgdir}/usr/bin/
    elif [ ${CARCH} = "riscv64" ]; then
        install -Dm755 riscv64/magiskboot -t ${pkgdir}/usr/bin/
    fi
}
