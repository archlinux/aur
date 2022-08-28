pkgname=gimp-devel-stripped
pkgver=2.99.12
pkgrel=1
pkgdesc='GNU Image Manipulation Program (development version, stripped from most unnecessary dependencies)'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('gtk3' 'babl' 'gegl' 'glib-networking' 'mypaint-brushes1' 'poppler-data' 'appstream-glib')
makedepends=('meson' 'ninja' 'intltool' 'iso-codes' 'gobject-introspection')
options=('!emptydirs' '!docs')

_name="${pkgname%-devel-stripped}"
_snapshot="${_name}-${pkgver}"

conflicts=("${_name}")
provides=("${_name}")

source=(
    "${_snapshot}.tar.xz::https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_snapshot}.tar.xz"
    "meson.patch"
)
sha256sums=(
    '7ba1b032ea520d540e4acad3da16d8637fe693743fdb36e0121775eea569f6a3'
    'bd48d0bfef2fcc3982fceb1d7aa9c6f20534a2bde2b2b19dca0a485e6bd5ceba'
)

prepare() {
    cd "${srcdir}/${_snapshot}"
    patch -p0 -i "${srcdir}/${source[1]}"
}

build() {
    cd "${srcdir}/${_snapshot}"

    meson "${srcdir}/build" \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/bin \
        --buildtype=release \
        -Denable-console-bin=false \
        -Dcheck-update=no \
        -Dlibunwind=false \
        -Dlibbacktrace=false \
        -Daa=disabled \
        -Dalsa=disabled \
        -Dappdata-test=disabled \
        -Dcairo-pdf=disabled \
        -Dghostscript=disabled \
        -Dgudev=disabled \
        -Dheif=disabled \
        -Djpeg2000=disabled \
        -Djpeg-xl=disabled \
        -Dmng=disabled \
        -Dopenexr=disabled \
        -Dprint=false \
        -Dwebp=disabled \
        -Dwmf=disabled \
        -Dxcursor=disabled \
        -Dxpm=disabled \
        -Dheadless-tests=disabled \
        -Dgi-docgen=disabled \
        -Dlinux-input=disabled \
        -Dvala-plugins=disabled \
        -Djavascript=false \
        -Dlua=false \
        -Dpython=false

    cd "${srcdir}"
    ninja -C "build"
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C "build" install

    cd "${_snapshot}"
    ln -s "${_name}-${pkgver%.*}" "${pkgdir}/usr/bin/${_name}"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
