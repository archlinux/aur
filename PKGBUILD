# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=distrho-extra-lv2
pkgname=${_pkgbasename}-git
pkgver=r26.b6f25f1
pkgrel=2
pkgdesc="Extra LV2 ports of JUCE-based audio plugins using the DISTRHO framework"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'MIT')
depends=('gcc-libs' 'lv2' 'libxext' 'freetype2' 'alsa-lib')
makedepends=('git' 'premake3' 'libxinerama' 'libxrender' 'libxcursor' 'ladspa')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename%%-*}::git://github.com/DISTRHO/DISTRHO-Ports.git"
	"${_pkgbasename}::git://github.com/DISTRHO/DISTRHO-Ports-Extra.git")
sha256sums=('SKIP'
	    'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgbasename%%-*}"

  # generate build script
  scripts/premake-update.sh linux

  cd "${srcdir}/${_pkgbasename}"

  # redefine links to DISTRHO libs and scripts
  ln -f -s "${srcdir}/${_pkgbasename%%-*}/libs"
  ln -f -s "${srcdir}/${_pkgbasename%%-*}/scripts"

  # generate build script
  scripts/premake-update.sh linux
}

# TODO: make DISTRHO-Ports a dependency instead of having to build it separately
build() {
  cd "${srcdir}/${_pkgbasename%%-*}"
  make libs

  cd "${srcdir}/${_pkgbasename}"
  make lv2
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  # lv2 plugins
  install -d "$pkgdir/usr/lib/lv2"
  cp -a bin/lv2/*.lv2 "$pkgdir/usr/lib/lv2"
}
