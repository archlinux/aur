# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
# 
# Use with care, I accept no responsibility what so ever.
pkgname=('opentx-companion')
pkgver=2.3.14
pkgrel=1
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares"
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'sdl' 'hicolor-icon-theme')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('cmake' 'xsd' 'bc' 'python' 'avr-gcc' 'avr-libc' 'sed' 'qt5-tools' 'python-pyqt5' 'arm-none-eabi-gcc' 'arm-none-eabi-binutils' 'arm-none-eabi-newlib' 'fox' 'python-pillow')
provides=('companion')
conflicts=('companion' 'companion9x-svn')
source=("https://github.com/opentx/opentx/archive/release/$pkgver.tar.gz"
"installprefix.patch"
)
sha256sums=(
    '0e96557c3eefb5635b7dab56dd7d7389975c05c1b2999094e245cd9a22b9edc6'
    '8c83d7c176dc43415560c0f569e5e8a402d133f0abd9785a0cf4f2529a893892'
)
_srcmap=opentx-release-$pkgver


build() {
  patch ${_srcmap}/tools/build-companion-release.sh $startdir/installprefix.patch
  cd "${_srcmap}"
  ./tools/build-companion-release.sh ${srcdir}/${_srcmap} ${srcdir}/build 23
}


package() {
  cd ${srcdir}/build
  make -j`nproc` DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion23.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator23.desktop
}

