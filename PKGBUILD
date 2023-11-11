# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Iru Cai <mytbk920423@gmail.com>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_pkgname=gegl
pkgname="${_pkgname}-git"
pkgver=0.4.47.r10635.3c4479f65
pkgrel=1
pkgdesc="Graph based image processing framework"
arch=('i686' 'x86_64')
url="https://www.gegl.org"
license=('GPL3' 'LGPL3')
depends=('babl>=0.1.78'
         'libspiro>=0.5.0'
         'json-glib>=1.0.0'
         'sdl2>=2.0.5') #'mrg'
makedepends=('git' 'meson' 'intltool' 'python' 'ruby'
             'luajit>=2.0.4'
             'libraw>=0.15.4'
             'openexr>=1.6.1'
             'ffmpeg'
             'librsvg>=2.40.6'
             'jasper>=1.900.1'
             'libtiff>=4.0.0'
             'libnsgif'
             'exiv2'
             'libgexiv2>=0.14.0'
             'lensfun>=0.2.5'
             'vala'
             'python-gobject>=3.2.0'
             'suitesparse'
             'gobject-introspection')
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

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "%s.r%s.%s" \
    $(grep -ozP "(?s)^project\('gegl'.*?version: *'\K[0-9.]*" meson.build|tr '\0' '\n') \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short HEAD)
}

build() {
    meson "${srcdir}/${_pkgname}"\
          "${srcdir}/build" \
        --prefix=/usr \
        -Dworkshop=true
    export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}

# vim: tabstop=2 expandtab
