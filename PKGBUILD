# Maintainer: lod <aur@cyber-anlage.de>
# Maintainer(opentx-version): Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer(opentx-version): Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer(opentx-version): Arnaud

_pkgbase=edgetx
_version_suffix=25
pkgname=${_pkgbase}-companion
pkgver=2.5.0
pkgrel=1
pkgdesc="EEPROM Editor for EdgeTX RC transmitter firmwares"
arch=('x86_64')
url='https://edgetx.org/'
license=('GPL-2.0')
depends=('qt5-base' 'qt5-multimedia' 'sdl' 'hicolor-icon-theme')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('cmake' 'gcc' 'git' 'xsd' 'bc' 'python' 'avr-gcc' 'avr-libc' 'sed' 'qt5-tools' 'python-pyqt5' 'arm-none-eabi-gcc' 'arm-none-eabi-binutils' 'arm-none-eabi-newlib' 'fox' 'python-pillow')
provides=('companion')
conflicts=('companion')
source=("git+https://github.com/EdgeTX/edgetx.git#tag=v${pkgver}"
        "install.patch"

)
sha256sums=('SKIP'
            'f156dfd0800251ea78ff01fb32704e5a5a826360d3f2da57b7d877521ba61a45')

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
  sed -i -e 's/Categories=Application/Categories=Development;/' companion${_version_suffix}.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator${_version_suffix}.desktop
}

