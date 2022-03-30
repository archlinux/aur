pkgname=gimp-stripped
pkgver=2.10.30
pkgrel=1
pkgdesc='GNU Image Manipulation Program (bare minimum package stripped from most unnecessary dependencies)'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('gtk2' 'babl' 'gegl' 'glib-networking' 'mypaint-brushes1' 'poppler-data')
makedepends=('intltool' 'iso-codes')
options=('!emptydirs' '!docs')

_name="${pkgname%-stripped}"
_snapshot="${_name}-${pkgver}"

conflicts=("${_name}")
provides=("${_name}")

source=(
    "${_snapshot}.tar.bz2::https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_snapshot}.tar.bz2"
    '0001-no-check-update.patch'
)

sha256sums=(
    '88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc'
    'ac3e8b44cf391f4ab3050652f2cc1f146f451fb25178d5a596d905f5bad13fcf'
)

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -p1 -i "${srcdir}/${source[1]}"
}

build() {
    cd "${srcdir}/${_snapshot}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/bin \
        --enable-mp \
        --disable-gimp-console \
        --disable-gtk-doc \
        --disable-check-update \
        --disable-python \
        --without-aa \
        --without-libtiff \
        --without-libxpm \
        --without-libmng \
        --without-wmf \
        --without-webkit \
        --without-print \
        --without-alsa \
        --without-linux-input \
        --without-hal \
        --without-script-fu \
        --without-xmc

    make
}

package() {
    cd "${srcdir}/${_snapshot}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/share/man"
    ln -s "gimptool-2.0" "${pkgdir}/usr/bin/gimptool"
}
