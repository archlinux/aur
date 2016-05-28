# Maintainer: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot-pulse
pkgver=2.0.3
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine, with pulseaudio"
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('scons' 'clang')
depends=('libxcursor' 'glu' 'libxinerama' 'freetype2' 'pulseaudio')
conflicts=("godot-git" "godot")
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
md5sums=('7206db8cfb320f379b1e1bcd41eadb31'
         'dca7c5c5682bdc8cc83386034e0d7d07'
         'f756e85756a9cbc06a328414abf74585')

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
        pulseaudio=yes bits=${_arch}
}

package() {

  cd "${srcdir}"

  install -Dm644 godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/godot.png
    
  cd "${srcdir}"/${pkgname}-${pkgver}-stable

  install -D -m755 bin/godot.x11.opt.tools.${_arch}.llvmss "${pkgdir}"/usr/bin/godot
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/godot/LICENSE
}
