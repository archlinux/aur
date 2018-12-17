# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot2
_pkgname=godot
pkgver=2.1.5
pkgrel=2
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine. Legacy version."
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('scons' 'clang' 'yasm')
depends=('libxcursor' 'libxinerama' 'freetype2' 'alsa-lib' 'libxrandr' 'libxi' 'libglvnd' 'glu')
_arch=''
if test "$CARCH" == x86_64; then
    _arch=('64')
else
  _arch=('32')
fi

source=(
  "https://github.com/godotengine/godot/archive/${pkgver}-stable.tar.gz"
  godot.desktop
  icon.png
)
sha256sums=('74179c08bcc20cc89b4ac2785a31f201d81eb4aa875c80ffcb82d9fb80e8e187'
            '371c766b4b3796dd57eb4a605dcbc99464cacbd2a38b01fa8630e62f05001678'
            'b6bb8e42625414303cf7608f08fe63bd3267486bf7a96586ebab05ade5189785')

prepare() {
  cd "${srcdir}"/${_pkgname}-${pkgver}-stable
}

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}-stable

  sed -n '/\/* Copyright/,/IN THE SOFTWARE./p' main/main.cpp | sed 's/\/\*//' | sed 's/\*\///' > LICENSE

  scons platform=x11 \
        tools=yes \
        target=release_debug \
        use_llvm=yes \
        builtin_openssl=yes \
        colored=yes \
        pulseaudio=no bits=${_arch} -j $((`nproc`+1))
}

package() {

  cd "${srcdir}"

  install -Dm644 godot.desktop "${pkgdir}"/usr/share/applications/godot2.desktop
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/godot2.png

  cd "${srcdir}"/${_pkgname}-${pkgver}-stable

  install -D -m755 bin/godot.x11.opt.tools.${_arch}.llvm "${pkgdir}"/usr/bin/godot2
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/godot2/LICENSE
}
