# Maintainer: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot
pkgver=2.0.4.1
pkgrel=2
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine"
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('scons' 'clang')
depends=('libxcursor' 'glu' 'libxinerama' 'freetype2' 'alsa-lib')
conflicts=("godot-git" "godot-pulse")
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
sha256sums=('7dc2a012740bef6ac1948e05a4bc9a21700af2dc861d963bbf1235fd93efadc9'
            'd2f5ae30b8c0c3fd8a20a451d34e9e9d0ba1b60a39b1f68484a9a74227c83822'
            'b6bb8e42625414303cf7608f08fe63bd3267486bf7a96586ebab05ade5189785')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}-stable

  sed -n '/\/* Copyright/,/IN THE SOFTWARE./p' main/main.cpp | sed 's/\/\*//' | sed 's/\*\///' > LICENSE

  scons platform=x11 \
        tools=yes \
        target=release_debug \
        use_llvm=yes \
        use_sanitizer=yes \
        use_leak_sanitizer=yes \
        builtin_zlib=yes \
        openssl=yes \
        colored=yes \
        pulseaudio=no bits=${_arch}
}

package() {

  cd "${srcdir}"

  install -Dm644 godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/godot.png
    
  cd "${srcdir}"/${pkgname}-${pkgver}-stable

  install -D -m755 bin/godot.x11.opt.tools.${_arch}.llvmss "${pkgdir}"/usr/bin/godot
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/godot/LICENSE
}
