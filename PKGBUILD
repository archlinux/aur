# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Iru Cai <mytbk920423@gmail.com>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_pkgname=gegl
pkgname="${_pkgname}-git"
pkgver=0.4.23.r9877.208f6b130
pkgrel=1
pkgdesc="Graph based image processing framework"
arch=('i686' 'x86_64')
url="https://www.gegl.org"
license=('GPL3' 'LGPL3')
depends=('babl>=0.1.74' 'libspiro' 'json-glib' 'sdl2') #'mrg'
makedepends=('git' 'meson' 'intltool' 'python' 'ruby' 'luajit'
             'libraw' 'openexr' 'ffmpeg' 'librsvg' 'jasper'
             'libtiff' 'libnsgif' 'exiv2' 'libgexiv2' 'lensfun'
             'vala' 'python-gobject'
             'suitesparse' 'gobject-introspection')
optdepends=('openexr: for using the openexr plugin'
            'ffmpeg: for using the ffmpeg plugin'
            'librsvg: for using the svg plugin'
            'libtiff: tiff plugin'
            'jasper: for using the jasper plugin'
            'libraw: raw plugin'
            'suitesparse: matting-levin plugin'
            'luajit: lua plugin'
            'libgexiv2: for image metadata'
            'lensfun: for lens distortion'
            'libnsgif: gif plugin')
provides=("gegl=${pkgver%%.r*}")
conflicts=('gegl')
options=(!libtool)
source=('git+https://gitlab.gnome.org/GNOME/gegl.git')
sha512sums=('SKIP')

prepare() {
    mkdir "${srcdir}/build" -p

    export CFLAGS CXXFLAGS LDFLAGS
    meson "${srcdir}/${_pkgname}"\
          "${srcdir}/build" \
        --prefix=/usr \
        -Dworkshop=true
}


pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "%s.r%s.%s" \
    $(grep -ozP "(?s)^project\('gegl'.*?version: *'\K[\d.]*" meson.build|tr '\0' '\n') \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short HEAD)
}

build() {
    export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}

# vim: tabstop=2 expandtab
