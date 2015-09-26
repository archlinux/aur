# Maintainer: Iru Cai <mytbk920423@gmail>
# Maintainer: Tim Van den Langenbergh <tmt_vdl@gmx.com>
# Contributor: Omar Botta <omarbotta@gnulinuxlibre.net>
# Contributor: Carlos Sanchez <cargabsj175@vegnux.org.ve>
# Contributor: Frederic Bezies <fredbezies@gmail.com>

pkgname=gnash-git
_gitname=gnash
pkgver=0.8.11.r22311.gf0f66ce
pkgrel=1
pkgdesc="The GNU SWF Player based on GameSWF - git development version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnash/"
license=('GPL3')
depends=('curl' 'giflib' 'sdl' 'libjpeg' 'libpng' 'libgl' 
  'glu' 'fontconfig' 'cairo' 'ffmpeg' 'jemalloc' 'boost-libs' 
  'gtk2' 'libldap' 'hicolor-icon-theme' 'desktop-file-utils' 'gconf' 
  'gtkglext' 'agg' 'gdk-pixbuf2')
makedepends=('mesa' 'xulrunner' 'pkgconfig' 'boost' 'git')
provides=('gnash-common' 'gnash-gtk' 'gnash')
conflicts=('gnash-common' 'gnash-gtk' 'gnash')
replaces=('gnash-common' 'gnash-gtk' 'gnash')
options=('!emptydirs')
install=$_gitname.install
backup=('etc/gnashpluginrc')
source=('git://git.sv.gnu.org/gnash.git'
       'jemalloc_gnash.patch')
sha256sums=('SKIP' '422aad0cf678f8427b1601e41e6440b3526872b640b6ccd3ab93ae656a9a8c8e')

pkgver() {
  cd $_gitname

  echo "0.8.11.r$(git rev-list --count master).g$(git log -1 --format="%h")" 
}

prepare() {
  cd $_gitname

  chmod +x autogen.sh
  ./autogen.sh
}

build() {
  cd $_gitname

  patch -Np1 -i "${srcdir}/jemalloc_gnash.patch"
  sed -i 's#${JEMALLOC_CONFIG} --cxxflags#${JEMALLOC_CONFIG} --cflags#g' configure
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-plugins-install=system \
    --with-npapi-plugindir=/usr/lib/mozilla/plugins \
    --enable-gui=sdl,gtk \
    --enable-media=ffmpeg \
    --enable-renderer=all \
    --enable-device=x11

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd $_gitname

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install install-plugin

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"

  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/gnash.schemas" --domain gnash \
    "$pkgdir"/usr/share/applications/*.schemas

  rm -f "$pkgdir"/usr/share/applications/*.schemas
}
