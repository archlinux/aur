# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=newscid
pkgver=1.3.45
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
sha256sums=('d82a46370cdc11458e44005cd4ad24a533c7ec3c3dcc78fffac8632e5107516c')

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
