# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Ysblokje <ysblokje at gmail dot com>
# Contributer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud

pkgname=edgetx-companion
pkgver=2.7.1
pkgrel=1
pkgdesc="EEPROM Editor and Simulator for EdgeTX RC radio transmitter firmwares"
arch=('x86_64')
url='https://edgetx.org/'
license=('GPL2')
depends=('hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'sdl')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib'
             'avr-gcc' 'avr-libc' 'bc' 'cmake' 'fox' 'gcc' 'git' 'icu' 'python'
             'python-pillow' 'python-pyqt5' 'qt5-svg' 'qt5-tools' 'qt5-translations'
             'sed' 'xsd')
provides=('companion')
conflicts=('companion')
_pkgbase=${pkgname%%-*}
_versuff=${pkgver/./} && _versuff=${_versuff%%.*}
source=("git+https://github.com/EdgeTX/edgetx.git#tag=v${pkgver}"
        install.patch)
sha256sums=('SKIP'
            'f9b62f82f402ea96153a7e45ec22aeaa4780039d57b28cc8ca8456e05c34ffe7')

prepare() {
  cd ${_pkgbase}
  patch ./tools/build-companion-nightly.sh < ${srcdir}/install.patch
  git submodule update --init --recursive
}

build() {
  cd ${_pkgbase}
  ./tools/build-companion-nightly.sh ${MAKEFLAGS} ${srcdir}/${_pkgbase} ${srcdir}/build ${_versuff}
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir}/ install
  cd ${pkgdir}/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Utility/' companion${_versuff}.desktop
  sed -i -e 's/Categories=Application/Categories=Utility/' simulator${_versuff}.desktop
}
