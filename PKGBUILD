# Maintainer: Jorge Araya Navarro <jorge@esavara.cr>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot-pulse
pkgver=3.0.5
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine, with pulseaudio"
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
sha256sums=('123723ebb6f59b2da00451963177309d0bc8c5cb4168e14f44dcbd00d4f12296')

build() {
  cd "${srcdir}"/${pkgname%-*}-${pkgver}-stable

  scons platform=x11 \
        tools=yes \
        target=release_debug \
        use_llvm=no \
        builtin_openssl=yes \
        colored=yes \
        pulseaudio=yes bits=${_arch} -j $((`nproc`+1))
}

package() {

  cd "${srcdir}"

  install -Dm644 "${srcdir}"/${pkgname%-*}-${pkgver}-stable/misc/dist/linux/godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
  install -Dm644 "${srcdir}"/${pkgname%-*}-${pkgver}-stable/icon.svg "${pkgdir}"/usr/share/pixmaps/godot.svg

  cd "${srcdir}"/${pkgname%-*}-${pkgver}-stable

  install -D -m755 bin/godot.x11.opt.tools.${_arch} "${pkgdir}"/usr/bin/godot
  install -D -m644 "${srcdir}"/${pkgname%-*}-${pkgver}-stable/LICENSE.txt "${pkgdir}"/usr/share/licenses/godot/LICENSE
  install -D -m644 "${srcdir}"/${pkgname%-*}-${pkgver}-stable/misc/dist/linux/godot.6 "${pkgdir}"/usr/share/man/man6/godot.6
}
