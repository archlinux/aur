# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=monacoin-qt
_coinname=monacoin
pkgver=0.14.2
pkgrel=1
pkgdesc="peer-to-peer network based digital currency - Qt GUI"
arch=('i686' 'x86_64')
url="https://monacoin.org/en/index.html"
license=('MIT')
provides=('monacoin-qt' 'monacoind' 'monacoin-tx')
depends=('openssl-1.0' 'boost-libs' 'libevent' 'db4.8' 'qt5-base' 'protobuf')
makedepends=('git' 'pkg-config' 'boost' 'gcc' 'make' 'autoconf' 'automake' 'libtool')
optdepends=('qrencode: for generating QR codes within the GUI' 'zeromq: send notifications via zeromq')
source=("https://github.com/monacoinproject/${_coinname}/archive/${_coinname}-${pkgver}.tar.gz"
        "0001-rename-libbitcoinconsensus-to-libmonacoinconsensus.patch"
        "monacoin-qt.desktop")
sha256sums=('03eac8256932150dfa2f399931530545f90ff8d03b4559f03e40836cfbf7be02'
            'bdb0f7efd41b02cb0407b194a2f8cb28d3c82f6ec7bbaf26e1144bf302e7f7d4'
            '4af25bac0076c6d2060832b66819741d3e049a71d6ad5f1a26a2700415d23cfc')
install=monacoin.install

prepare() {
    mv "${srcdir}/monacoin-monacoin-${pkgver}" "${srcdir}/${_coinname}-${pkgver}"
    cd "${srcdir}/${_coinname}-${pkgver}"
    patch -p1 <"${srcdir}/0001-rename-libbitcoinconsensus-to-libmonacoinconsensus.patch"
}

build() {
    cd "${srcdir}/${_coinname}-${pkgver}"
    export PKG_CONFIG_PATH="/usr/lib/openssl-1.0/pkgconfig"
    export CXXFLAGS+=" -I/usr/include/openssl-1.0"
    export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl"
    ./autogen.sh
    ./configure --prefix=/usr --with-pic --disable-shared --enable-cxx \
        --disable-bench --disable-tests
    make ${MAKEFLAGS}
}

package() {
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cd "${srcdir}/${_coinname}-${pkgver}"
    install -Dm644 share/pixmaps/bitcoin256.xpm "${pkgdir}/usr/share/pixmaps/monacoin.xpm"
    make DESTDIR="${pkgdir}" install
}
