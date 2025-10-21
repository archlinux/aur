# Maintainer: Jörn Hofmann <joernhofmann@web.de>
pkgbase=rkcfgtool-git
pkgname=rkcfgtool-git
pkgver=1.0.0.r0.g414bf46
pkgrel=1
pkgdesc="Command line utility for Rockchip RKDevTool configuration files"
arch=('any')
depends=()
makedepends=('git' 'make' 'gcc')
checkdepends=('diffutils' 'grep' 'xxd')
url="https://github.com/guoh27/rkcfgtool"
license=('MIT')
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
source=(
    "${pkgname}::git+${url}.git"
)
sha256sums=(
    "SKIP"
)

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

check() {
    cd "${srcdir}/${pkgname}"
    chmod +x test.sh
    ./test.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
