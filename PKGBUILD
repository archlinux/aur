# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=(adlplug-git opnplug-git)
_pkgname=ADLplug
pkgver=v1.0.0.beta.2.r1.b5ac366
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jpcima/ADLplug"
license=('GPL')
groups=('pro-audio')
depends=('jack' 'alsa-lib' 'freetype2' 'libxext')
makedepends=('git')
source=('git+https://github.com/jpcima/ADLplug.git'
        'git+https://github.com/Wohlstand/libADLMIDI.git'
        'git+https://github.com/Wohlstand/libOPNMIDI.git'
        'git+https://github.com/jpcima/JUCE.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/brofield/simpleini.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  for submodule in \
    thirdparty/libADLMIDI thirdparty/libOPNMIDI \
    thirdparty/JUCE thirdparty/fmt thirdparty/simpleini
  do
    git config "submodule.${submodule}.url" "${srcdir}/`basename "${submodule}"`"
  done
  git submodule update

  cd "${srcdir}"
  cp -rf "${_pkgname}" "${_pkgname}-opn"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DADLplug_CHIP=OPL3 ..
  make

  cd "${srcdir}/${_pkgname}-opn"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DADLplug_CHIP=OPN2 ..
  make
}

package_adlplug-git() {
  pkgdesc="FM synthesizer for ADLMIDI with OPL3 chip emulation"
  provides=('adlplug')
  conflicts=('adlplug')

  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}/" install
}

package_opnplug-git() {
  pkgdesc="FM synthesizer for OPNMIDI with OPN2 chip emulation"
  provides=('opnplug')
  conflicts=('opnplug')

  cd "${srcdir}/${_pkgname}-opn/build"
  make DESTDIR="${pkgdir}/" install
}
