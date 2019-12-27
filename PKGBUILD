# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=distrho-extra-lv2
pkgname=${_pkgbasename}-git
pkgver=r26.b6f25f1
pkgrel=1
pkgdesc="Extra LV2 ports of JUCE-based audio plugins using the DISTRHO framework"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'MIT')
depends=('gcc-libs' 'lv2' 'libxext' 'freetype2' 'alsa-lib')
makedepends=('git' 'premake3' 'libxinerama' 'libxrender' 'libxcursor' 'ladspa' 'clang')
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
  # Work-around issues with GCC version 9 (https://github.com/DISTRHO/DISTRHO-Ports/issues/45)
  export CC=clang
  export CXX=clang++

  cd "${srcdir}/${_pkgbasename%%-*}"
  # Fix compiler flag issue when mixing C++ and C sources (https://github.com/premake/premake-core/issues/198)
  sed -i 's/-std=c++0x//g' ports/stereosourceseparation/LV2/StereoSourceSeparation.lv2/StereoSourceSeparation.make
  sed -i 's/CXXFLAGS += \$(CFLAGS)/CXXFLAGS += \$(CFLAGS) -std=c++0x/g' ports/stereosourceseparation/LV2/StereoSourceSeparation.lv2/StereoSourceSeparation.make

  make lv2

  cd "${srcdir}/${_pkgbasename}"
  # Fix compiler flag issue when mixing C++ and C sources (https://github.com/premake/premake-core/issues/198)
  sed -i 's/-std=c++0x//g' ports/PdPulp/LV2-fx/PdPulpFX.lv2/PdPulpFX.make
  sed -i 's/CXXFLAGS += \$(CFLAGS)/CXXFLAGS += \$(CFLAGS) -std=c++0x/g' ports/PdPulp/LV2-fx/PdPulpFX.lv2/PdPulpFX.make
  sed -i 's/-std=c++0x//g' ports/PdPulp/LV2-ins/PdPulp.lv2/PdPulp.make
  sed -i 's/CXXFLAGS += \$(CFLAGS)/CXXFLAGS += \$(CFLAGS) -std=c++0x/g' ports/PdPulp/LV2-ins/PdPulp.lv2/PdPulp.make

  make lv2
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  # lv2 plugins
  install -d "$pkgdir/usr/lib/lv2"
  cp -a bin/lv2/*.lv2 "$pkgdir/usr/lib/lv2"
}
