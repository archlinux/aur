# Maintainer: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot-pulse
pkgver=3.1.1
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine"
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('scons' 'gcc' 'yasm')
depends=('libxcursor' 'libxinerama' 'freetype2' 'pulseaudio' 'libxrandr' 'libxi' 'libglvnd')
conflicts=("godot-git" "godot")
_arch=''
if test "$CARCH" == x86_64; then
    _arch=('64')
else
  _arch=('32')
fi

source=(
  "https://github.com/godotengine/godot/archive/${pkgver}-stable.tar.gz"
)
sha256sums=('3d952cda12a43d71c53c508bc64ca82cc165a3345976b6d128f869d5bd7a61d2')

build() {
  cd "${srcdir}"/${pkgname%-*}-${pkgver}-stable

  scons platform=x11 \
        tools=yes \
        target=release_debug \
        use_llvm=no \
        colored=yes \
        pulseaudio=yes bits=${_arch} -j $((`nproc`+1))
}

package() {

  cd "${srcdir}"

  install -Dm644 "${srcdir}"/${pkgname%-*}-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
  install -Dm644 "${srcdir}"/${pkgname%-*}-${pkgver}-stable/icon.svg "${pkgdir}"/usr/share/pixmaps/godot.svg

  cd "${srcdir}"/${pkgname%-*}-${pkgver}-stable

  install -D -m755 bin/godot.x11.opt.tools.${_arch} "${pkgdir}"/usr/bin/godot
  install -D -m644 "${srcdir}"/${pkgname%-*}-${pkgver}-stable/LICENSE.txt "${pkgdir}"/usr/share/licenses/godot/LICENSE
  install -D -m644 "${srcdir}"/${pkgname%-*}-${pkgver}-stable/misc/dist/linux/godot.6 "${pkgdir}"/usr/share/man/man6/godot.6
}
