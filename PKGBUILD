# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=(adlplug-git opnplug-git)
_pkgname=ADLplug
pkgver=v1.0.1.r35.025baba
pkgrel=1
pkgdesc="FM chip synthesizer"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/ADLplug"
license=('GPL')
groups=('pro-audio')
depends=('fmt' 'jack' 'liblo' 'freetype2' 'libxext' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'libxrandr' 'libxinerama' 'libxcursor')
source=('git+https://github.com/jpcima/ADLplug.git'
        'git+https://github.com/Wohlstand/libADLMIDI.git'
        'git+https://github.com/Wohlstand/libOPNMIDI.git'
        'git+https://github.com/jpcima/JUCE.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/jpcima/simpleini.git'
        "juce-gcc9.patch::https://github.com/WeAreROLI/JUCE/commit/4e0adb2af8b424c43d22bd431011c9a6c57d36b6.patch")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '263fe21e7362f4b8c4009d33e8a086ddf57ddd44267343b924f1304a58580a38e6bd2d36c9548ec706be733476d27e5c89f8095f401b9b841ade63d9cb812a77')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long --exclude nightly --exclude latest | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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

  patch -Np1 -d thirdparty/JUCE -i "${srcdir}"/juce-gcc9.patch

  cd "${srcdir}"
  cp -rf "${_pkgname}" "${_pkgname}-opn"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DADLplug_CHIP=OPL3 \
        -DADLplug_USE_SYSTEM_FMT=ON \
        ..
  make

  cd "${srcdir}/${_pkgname}-opn"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DADLplug_CHIP=OPN2 \
        -DADLplug_USE_SYSTEM_FMT=ON \
        ..
  make
}

package_adlplug-git() {
  pkgdesc="FM synthesizer for ADLMIDI with OPL3 chip emulation"
  provides=('adlplug')
  conflicts=('adlplug')

  cd "${srcdir}/${_pkgname}"
  make -C build DESTDIR="${pkgdir}/" install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

package_opnplug-git() {
  pkgdesc="FM synthesizer for OPNMIDI with OPN2 chip emulation"
  provides=('opnplug')
  conflicts=('opnplug')

  cd "${srcdir}/${_pkgname}-opn"
  make -C build DESTDIR="${pkgdir}/" install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
