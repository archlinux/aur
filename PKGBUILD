# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=distrho-extra-lv2
pkgname=${_pkgbasename}-git
pkgver=r25.0b3a99b
pkgrel=1
pkgdesc="Extra LV2 ports of JUCE-based audio plugins using the DISTRHO framework"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'MIT')
depends=('lv2' 'freetype2' 'libxext')
makedepends=('git' 'premake3')
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
  # https://github.com/DISTRHO/DISTRHO-Ports-Extra/issues/1
  sed -i 's/JUCE_ALLOW_STATIC_NULL_VARIABLES 0/JUCE_ALLOW_STATIC_NULL_VARIABLES 1/' libs/juce/build-juce/AppConfig.h
  make
  
  cd "${srcdir}/${_pkgbasename}"

  # redefine links to DISTRHO libs and scripts
  ln -f -s "${srcdir}/${_pkgbasename%%-*}/libs"
  ln -f -s "${srcdir}/${_pkgbasename%%-*}/scripts"
  
  # generate build script
  scripts/premake-update.sh linux
}

build() {
  cd "${srcdir}/${_pkgbasename}"

  make lv2
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  # lv2 plugins
  install -d "$pkgdir/usr/lib/lv2"
  cp -a bin/lv2/*.lv2 "$pkgdir/usr/lib/lv2"
}
