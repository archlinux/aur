# Maintainer: Ivan Kanis
pkgname=tclreadline
pkgver=2.4.1
pkgrel=1
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
sha256sums=('d14b1568b6db8cd51659e3cc476a1f45da2020434ebb90b4b0defbc424f05907')

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
