_name=gimp
pkgname=${_name}-devel-stripped
pkgver=2.99.14
pkgrel=4
pkgdesc='GNU Image Manipulation Program (development version, stripped from most unnecessary dependencies)'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL' 'LGPL')
conflicts=("${_name}")
provides=("${_name}")
depends=('gtk3' 'babl' 'gegl' 'glib-networking' 'mypaint-brushes1' 'appstream-glib' 'libgexiv2')
makedepends=('meson' 'intltool' 'iso-codes' 'gobject-introspection' 'libxslt' 'libxmu')

_snapshot="${_name}-${pkgver}"

source=(
    "https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_snapshot}.tar.xz"
    "01-meson.patch"
    "02-babl-version-fix.patch::https://gitlab.gnome.org/GNOME/gimp/-/commit/04a78154e1af5e30dcedde6dbaa321be3f0e24b1.patch"
)

sha256sums=(
    '313a205475d1ff03c5c4d9602f09f5c975ba6c1c79d8843e2396f9fe2abdf7a8'
    '9bcd77bfdaf17eccc227068ed39bc08ec0dbbc296026044d6816c12d36d2ebe7'
    'e012d022fe53eaf4cd2fc08f07cb0377fb14c8f791e42d13027983e41f7f4fc2'
)

options=('!docs')

prepare() {
    cd "${_snapshot}"
    patch -p0 -i "${srcdir}/${source[1]}"
    patch -p1 -i "${srcdir}/${source[2]%::*}"
}

_buildflags=(
    enable-console-bin=false
    check-update=no
    libunwind=false
    libbacktrace=false
    aa=disabled
    alsa=disabled
    appdata-test=disabled
    cairo-pdf=disabled
    ghostscript=disabled
    gudev=disabled
    heif=disabled
    jpeg2000=disabled
    jpeg-xl=disabled
    mng=disabled
    openexr=disabled
    print=false
    webp=disabled
    wmf=disabled
    xcursor=disabled
    xpm=disabled
    headless-tests=disabled
    gi-docgen=disabled
    linux-input=disabled
    vala-plugins=disabled
    javascript=false
    lua=false
    python=false
)

_buildflags=("${_buildflags[@]/#/"-D"}")

build() {
    arch-meson "${_buildflags[@]}" \
        "build" "${_snapshot}"

    meson compile -C "build"
}

package() {
    DESTDIR="${pkgdir}" meson install -C "build"
    install -Dm644 "${_snapshot}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
