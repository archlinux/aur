# Maintainer: urklang <nicolas at zrna dot org>
# Contributor: urklang <nicolas at zrna dot org>
_pkgbasename=distrho
pkgname=${_pkgbasename}-git
pkgver=r468.a953bed0
pkgrel=1
pkgdesc="Distrho Audio Plugins both LV2 and VST, using the JUCE Toolkit"
arch=('x86_64')
url="http://https://distrho.sourceforge.io/"
license=('GPL' 'GPL3')
depends=('gcc-libs' 'lv2' 'libxext' 'freetype2' 'alsa-lib')
makedepends=('git' 'premake3' 'libxinerama' 'libxrender' 'libxcursor' 'ladspa' 'meson')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}" 'distrho-plugins' 'distrho-plugins-lv2-git' 'distrho-lv2-git' 'distrho-vst-git')
source=("${_pkgbasename}::git+https://github.com/DISTRHO/DISTRHO-Ports.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgbasename}"

  # generate build script
  scripts/premake-update.sh linux
}

build() {
  cd "${srcdir}/${_pkgbasename}"
  meson build --buildtype release
  ninja -C build
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  DESTDIR="${pkgdir}" ninja -C build install
}