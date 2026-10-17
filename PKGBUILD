# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=newscid
pkgver=1.3.16
pkgrel=1
pkgdesc="Modern Chess Information Database (Scid vs. PC Rewrite)"
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
sha256sums=('4e72998eb71abd2289b92c2c3b787ec83cdd82e8cc4b912a123ee2f225ca41a6')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/frontend"
    npm install
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
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
