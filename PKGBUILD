# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=newscid
pkgver=2.1.0
pkgrel=1
pkgdesc="Chess Information Database (Scid v4 compatible)"
arch=('x86_64')
url="https://github.com/chrisfair/newscid"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
makedepends=('go' 'nodejs' 'npm' 'git' 'python-pillow')
optdepends=(
    'stockfish: strong default UCI chess engine'
    'fruit: legacy UCI chess engine'
    'scid: legacy database tools (tcscid)'
)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/chrisfair/newscid/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bcf43b311ca316f788832ea11f0b710e2b13a250ab183db21254b6e3928059f4')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/frontend"
    npm install
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    unset GOROOT
    export PATH="/usr/bin:${PATH}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
