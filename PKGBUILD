# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor : speps <speps at aur dot archlinux dot org>
_pkgbasename=distrho-lv2
pkgname=${_pkgbasename}-git
pkgver=r417.7e62235e
pkgrel=1
pkgdesc="Distrho LV2 Audio Plugins, using the JUCE Toolkit"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3')
depends=('gcc-libs' 'lv2' 'libxext' 'freetype2' 'alsa-lib')
makedepends=('git' 'premake3' 'libxinerama' 'libxrender' 'libxcursor' 'ladspa' 'clang')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}" 'distrho-plugins' 'distrho-plugins-lv2-git')
source=("${_pkgbasename}::git://github.com/DISTRHO/DISTRHO-Ports.git")
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

  # Work-around issues with GCC version 9 (https://github.com/DISTRHO/DISTRHO-Ports/issues/45)
  export CC=clang
  export CXX=clang++

  # Fix compiler flag issue when mixing C++ and C sources (https://github.com/premake/premake-core/issues/198)
  sed -i 's/-std=c++0x//g' ports/stereosourceseparation/LV2/StereoSourceSeparation.lv2/StereoSourceSeparation.make
  sed -i 's/CXXFLAGS += \$(CFLAGS)/CXXFLAGS += \$(CFLAGS) -std=c++0x/g' ports/stereosourceseparation/LV2/StereoSourceSeparation.lv2/StereoSourceSeparation.make
  # End of work-around

  make lv2
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  # lv2 plugins
  install -d "$pkgdir/usr/lib/lv2"
  cp -a bin/lv2/*.lv2 "$pkgdir/usr/lib/lv2"
}

