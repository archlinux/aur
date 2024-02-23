# Maintainer: Gustavo Alvarez Lopez <sl1pkn07@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Score_Under <seejay.11@gmail.com>

pkgname=xnp2-svn
pkgver=0.86.2847
pkgrel=1
pkgdesc="X Neko Project II, a PC-9801 emulator. (SVN Version)"
arch=('x86_64')
url='http://www.nonakap.org/np2'
license=('BSD')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'gtk2' 'libgdk-x11-2.0.so' 'libgtk-x11-2.0.so'
  'sdl2' # libSDL2-2.0.so
  'sdl2_mixer' # libSDL2_mixer-2.0.so
  'libxxf86vm' # libXxf86vm.so
  'libice' # libICE.so 
  'libsm' # libSM.so
  'libx11' # libX11.so
  'libusb' 'libusb-1.0.so'
  'at-spi2-core' 'libatk-1.0.so'
  'cairo' 'libcairo.so'
  'harfbuzz' 'libharfbuzz.so'
  'gdk-pixbuf2' 'libgdk_pixbuf-2.0.so'
  'libxext' # libXext.so
  'fontconfig' 'libfontconfig.so'
  'freetype2' 'libfreetype.so'
  'pango' 'libpango-1.0.so' 'libpangocairo-1.0.so' 'libpangoft2-1.0.so'
  'glib2' 'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
)
makedepends=(
  'subversion'
  'nasm'
)
conflicts=('xnp2')
provides=('xnp2')
source=("xnp2::svn+http://amethyst.yui.ne.jp/svn/pc98/np2/trunk/")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd xnp2
  _ver="$(cat np2ver.h | grep -m1 'NP2VER_CORE' | sed 's|NP2|NPTWO|g' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.$(svnversion)"
}

prepare() {
  mkdir -p build

  cd xnp2/x11
  ./autogen.sh

  cd "${srcdir}/build"
  ../xnp2/x11/configure \
    --prefix=/usr \
    --enable-build-all \
    --enable-ia32

}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
