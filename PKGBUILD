# Maintainer: lod <aur@cyber-anlage.de>
# Maintainer(opentx-version): Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer(opentx-version): Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer(opentx-version): Arnaud

_pkgbase=edgetx
_version_suffix=25
pkgname=${_pkgbase}-companion
pkgver=2.5.0
pkgrel=1
pkgdesc="EEPROM Editor and Simulator for EdgeTX RC radio transmitter firmwares"
arch=('x86_64')
url='https://edgetx.org/'
license=('GPL2')
depends=('hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'sdl')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'avr-gcc' 'avr-libc' 'bc' 'cmake' 'fox' 'gcc' 'git' 'python' 'python-pillow' 'python-pyqt5' 'qt5-svg' 'qt5-tools' 'qt5-translations' 'sed' 'xsd')
provides=('companion')
conflicts=('companion')
source=("git+https://github.com/EdgeTX/edgetx.git#tag=v${pkgver}"
        "install.patch"
)

sha256sums=('SKIP'
            '36bf7c59adfe9221f8b03809e0ca0dc537328e239b2384829fb17290137e5005')

prepare() {
  cd ${_pkgbase}
  patch ./tools/build-companion-nightly.sh < ${srcdir}/install.patch
  git submodule update --init --recursive
}

build() {
  cd ${_pkgbase}
  ./tools/build-companion-nightly.sh ${srcdir}/${_pkgbase} ${srcdir}/build ${_version_suffix}
}

package() {
  cd ${srcdir}/build
  make -j`nproc` DESTDIR=${pkgdir}/ install
  cd ${pkgdir}/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Utility/' companion${_version_suffix}.desktop
  sed -i -e 's/Categories=Application/Categories=Utility/' simulator${_version_suffix}.desktop
}
