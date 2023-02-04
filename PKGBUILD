pkgname=gimp-devel-stripped
pkgver=2.99.14
pkgrel=3
pkgdesc='GNU Image Manipulation Program (development version, stripped from most unnecessary dependencies)'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('gtk3' 'babl' 'gegl' 'glib-networking' 'mypaint-brushes1' 'appstream-glib' 'libgexiv2')
makedepends=('meson' 'intltool' 'iso-codes' 'gobject-introspection' 'libxslt' 'libxmu')
options=('!docs')

_name="${pkgname%%-*}"
_snapshot="${_name}-${pkgver}"

conflicts=("${_name}")
provides=("${_name}")

source=(
    "${_snapshot}.tar.xz::https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_snapshot}.tar.xz"
    "01-meson.patch"
)
sha256sums=(
    '313a205475d1ff03c5c4d9602f09f5c975ba6c1c79d8843e2396f9fe2abdf7a8'
    '9bcd77bfdaf17eccc227068ed39bc08ec0dbbc296026044d6816c12d36d2ebe7'
)

prepare() {
    cd "${_snapshot}"
    patch -p0 -i "${srcdir}/${source[1]}"
}

build() {
    local options=(
        -Denable-console-bin=false
        -Dcheck-update=no
        -Dlibunwind=false
        -Dlibbacktrace=false
        -Daa=disabled
        -Dalsa=disabled
        -Dappdata-test=disabled
        -Dcairo-pdf=disabled
        -Dghostscript=disabled
        -Dgudev=disabled
        -Dheif=disabled
        -Djpeg2000=disabled
        -Djpeg-xl=disabled
        -Dmng=disabled
        -Dopenexr=disabled
        -Dprint=false
        -Dwebp=disabled
        -Dwmf=disabled
        -Dxcursor=disabled
        -Dxpm=disabled
        -Dheadless-tests=disabled
        -Dgi-docgen=disabled
        -Dlinux-input=disabled
        -Dvala-plugins=disabled
        -Djavascript=false
        -Dlua=false
        -Dpython=false
    )

    arch-meson --buildtype=release \
        "${options[@]}" "build" "${_snapshot}"

    meson compile -C "build"
}

package() {
    DESTDIR="${pkgdir}" meson install -C "build"

    cd "${_snapshot}"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
