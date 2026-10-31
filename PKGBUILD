# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=wailsmaxima
pkgver=1.0.0
pkgrel=1
pkgdesc="Symbolic and numerical Computer Algebra System workstation for Maxima (wxMaxima compatible)"
arch=('x86_64')
url="https://github.com/chrisfair/wailsmaxima"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'maxima' 'hicolor-icon-theme')
makedepends=('go' 'nodejs' 'npm' 'git')
optdepends=(
    'gnuplot: external plotting backend for Maxima'
    'texlive-basic: compile exported LaTeX (.tex) notebooks'
)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/chrisfair/wailsmaxima/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01acccc346916a5d6a17f1d954be4bd6c98276e21e6b4882e55ab7ffe82fc88e')

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

    make build-aur
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
