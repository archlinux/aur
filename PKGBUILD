# Maintainer: mickele
pkgname=tclreadline
pkgver=2.3.8
pkgrel=2
pkgdesc="GNU readline for interactive tcl shells"
url="https://github.com/flightaware/tclreadline"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'readline')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install=''
source=("https://github.com/flightaware/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a64e0faed5957b8e1ac16f179948e21cdd6d3b8313590b7ab049a3192ab864fb')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf -ivf
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # tk-existence seems to have no impact on build, but breaks configure otherwise
    TKOPT=""
    pkgconf tk || TKOPT="--without-tk"

    ./configure --prefix=/usr \
                --with-tcl=/usr/lib \
                --with-tcl-includes=/usr/include/tcl \
                ${TKOPT}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install

    install -m644 -D -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${pkgname}-${pkgver}/"{COPYING,sample.tclshrc,SCENARIO}
}
