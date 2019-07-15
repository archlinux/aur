# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot2
_pkgname=godot
pkgver=2.1.6
pkgrel=1
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
sha512sums=('7cb53ee08da7def581a4b7ff4727237d4ee65eb8ff66e83d949f9b9b724338ca2a352f0e9e4bfbbe672d51ca285792a08fffe2cb12d59a3cd20869a1d1407603'
             '8ed277979bb8c6b4fd027cd4a6f601db28c0ab706f20f9a7da791f2efe0f03b1a2eeedfaf78b11200e61c68dc51a8d25a1880a7abe01597b1c009ce1489150a4'
           '66747968461dc446db613bef82cacf32037fed9b7a6d2f51e86ed557d2eed931fda10bb6427df2d6915bb7fe71457830c07a0db0f293e157ec70581cf732ff0b')

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
