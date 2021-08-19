# Maintainer: Borislav Kosharov <bosakmaw@gmail.com>
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot-headless
pkgver=3.3.3
pkgrel=1
pkgdesc='An advanced, feature packed, multi-platform 2D and 3D game engine'
url='http://www.godotengine.org'
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('scons' 'gcc' 'yasm')
depends=('freetype2' 'alsa-lib' 'libglvnd')
conflicts=('godot' 'godot-git' 'godot-pulse')
_arch=''
if test "$CARCH" == x86_64; then
  _arch=('64')
else
  _arch=('32')
fi

source=(
  "https://github.com/godotengine/godot/archive/${pkgver}-stable.tar.gz"
)
sha256sums=('3f11176764b52df1b48cc33c768b9d7d6bb26c1d85a43e2bc70cd7507de33c94')

build() {
  cd "${srcdir}"/godot-${pkgver}-stable

  scons platform=server \
        tools=yes \
        target=release_debug \
        use_llvm=no \
        colored=yes \
        pulseaudio=no bits=${_arch} -j $((`nproc`+1))
}

package() {
  cd "${srcdir}"/godot-${pkgver}-stable

  install -D -m755 bin/godot_server.x11.opt.tools.${_arch} "${pkgdir}"/usr/bin/godot
  install -D -m644 "${srcdir}"/godot-${pkgver}-stable/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -D -m644 "${srcdir}"/godot-${pkgver}-stable/misc/dist/linux/godot.6 "${pkgdir}"/usr/share/man/man6/godot.6
}

