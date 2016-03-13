# Maintainer: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot
pkgver=2.0.1
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine"
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('scons' 'pulseaudio')
depends=('glu' 'libxcursor' 'libxinerama' 'alsa-lib' 'freetype2' 'mesa')
optdepends=()
conflicts=("godot-git")
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
md5sums=('83e1ec74ca3156af548f0e829085cdf7'
         'dca7c5c5682bdc8cc83386034e0d7d07'
         'f756e85756a9cbc06a328414abf74585')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}-stable

  sed -n '/\/* Copyright/,/IN THE SOFTWARE./p' main/main.cpp | sed 's/\/\*//' | sed 's/\*\///' > LICENSE

  scons platform=x11 tools=yes target=release_debug bits=${_arch}
}

package() {

  cd "${srcdir}"

  install -Dm644 godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/godot.png
    
  cd "${srcdir}"/${pkgname}-${pkgver}-stable

  install -D -m755 bin/godot.x11.opt.tools.${_arch} "${pkgdir}"/usr/bin/godot
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/godot/LICENSE
}

md5sums=('5539d540b932d1bd34c0645d8d713d21'
         'dca7c5c5682bdc8cc83386034e0d7d07'
         'f756e85756a9cbc06a328414abf74585')
