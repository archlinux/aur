# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ch34xsercfg-git
pkgname=(ch34xsercfg-git)
pkgver=r48.d4af106
pkgrel=1
pkgdesc="USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc. (ch34xsercfg)"
arch=($CARCH)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
url="https://github.com/WCHSoftGroup/ch343ser_linux"
license=('GPL-2.0-or-later')
depends=(
    glibc
    libch343ser
    libch9344ser)
makedepends=('git')
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')
options=(!strip !debug)

pkgver() {
    cd "${srcdir}/${pkgbase}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
    cd "$srcdir/${pkgbase}/demo/param_config"
    gcc ch34x_demo_param_config.c -lch34xcfg -lch343 -lch9344 -o ch34xsercfg
}
package() {
    cd "$srcdir/${pkgbase}/demo/param_config"
    install -Dm755 ch34xsercfg -t "${pkgdir}/usr/bin/"

}
