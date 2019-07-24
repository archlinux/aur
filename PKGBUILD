# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Iru Cai <mytbk920423@gmail.com>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=gegl-git
_pkgname=${pkgname%-git}
pkgver=0.4.9.r8934.cf7eacb75
pkgrel=1
pkgdesc="Graph based image processing framework"
arch=('i686' 'x86_64')
url="http://www.gegl.org"
license=('GPL3' 'LGPL3')
depends=('babl>=0.1.68' 'libspiro' 'json-glib')
makedepends=('git' 'intltool' 'python2' 'ruby' 'lua'
             'libraw' 'openexr' 'ffmpeg' 'librsvg' 'jasper'
             'libtiff' 'suitesparse' 'gobject-introspection')
optdepends=('openexr: for using the openexr plugin'
            'ffmpeg: for using the ffmpeg plugin'
            'librsvg: for using the svg plugin'
            'libtiff: tiff plugin'
            'jasper: for using the jasper plugin'
            'libraw: raw plugin'
            'suitesparse: matting-levin plugin'
            'lua: lua plugin')
provides=("gegl=$pkgver")
conflicts=('gegl')
options=(!libtool)
source=('git+https://gitlab.gnome.org/GNOME/gegl.git')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf "%s.r%s.%s" \
  	$(cat configure.ac | grep '^m4_define(\[gegl_.*_version\], \[[0-9]*\])' | tr -d '\n' | sed -e 's|^m4_define(\[gegl_major_version\], \[||' -e 's|\])m4_define(\[gegl_minor_version\], \[|.|' -e 's|\])m4_define(\[gegl_micro_version\], \[|.|' -e 's|\])|\n|') \
  	$(git rev-list --count HEAD) \
  	$(git rev-parse --short HEAD)
}

prepare() {
  cd $_pkgname

  autoreconf -if

  ./configure \
  	--prefix=/usr \
  	--with-sdl \
  	--with-openexr \
  	--with-librsvg \
  	--with-libavformat \
  	--with-jasper \
  	--disable-docs \
  	--enable-workshop \
  	--enable-introspection=yes
}

build() {
  cd $_pkgname

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install
}

