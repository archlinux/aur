# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
# 
# Use with care, I accept no responsibility what so ever.
pkgname=('opentx-companion')
pkgver=2.2.4
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
source=("https://github.com/opentx/opentx/archive/$pkgver.tar.gz"
"installprefix.patch"
"ref_issue.patch"
)
#"qt5_modules.patch"
sha256sums=(
    'abc5bced1f04e436882d5c36abc7cf53d4e17aa67db9df2b43dc036a2656141b'
    '9d669cf723e98b7be5463538b0590ae7776b3b866a423cceeb30ba9840748c64'
    'baec8d907bc468771c6c425a47bcdb2ed291bdfadedc9a14884158d28e70814a'
)
    #'30fd1396a47bfc250780786e52447547aafcf934c6fe1775e4301fa3c7185be2'

build() {
  patch $srcdir/opentx-$pkgver/tools/build-companion-release.sh $startdir/installprefix.patch
  pushd $srcdir/opentx-$pkgver/
  patch -p1 < $startdir/ref_issue.patch
  popd
#  cd $srcdir/opentx-$pkgver
#  patch -t -p 1 < $startdir/qt5_modules.patch
  $srcdir/opentx-$pkgver/tools/build-companion-release.sh $srcdir/opentx-$pkgver dummy
}


package() {
  cd $srcdir/build
  make -j`nproc` DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion22.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator22.desktop
}

