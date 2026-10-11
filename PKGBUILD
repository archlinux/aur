# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=newscid
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern Chess Information Database (Scid vs. PC Rewrite)"
arch=('x86_64')
url="https://gitlab.com/bughouse1/newscid"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
makedepends=('go' 'nodejs' 'npm' 'git' 'python-pillow')
optdepends=(
    'stockfish: strong default UCI chess engine'
    'fruit: legacy UCI chess engine'
    'scid: legacy database tools (tcscid)'
)
source=("git+https://gitlab.com/bughouse1/newscid.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}/frontend"
    npm install
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    make build
}

package() {
    cd "${srcdir}/${pkgname}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
