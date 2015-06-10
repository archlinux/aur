# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Todd Musall
# Contributor: dront78 (Ivan)
# Contributor: Victor Noel
# Contributor: ngoonee

_pkgname=heimdall
pkgname=$_pkgname-cleanui
pkgver=1.4.1
pkgrel=3
pkgdesc='A cross-platform utility to flash firmware (aka ROMs) onto Samsung devices - patched to remove donation menu'
arch=('i686' 'x86_64')
url='http://www.glassechidna.com.au/products/heimdall'
license=('MIT')
depends=('libusb' 'qt4')
makedepends=('git')
optdepends=('android-udev: udev rules to connect Android devices to your linux box')
conflicts=("$_pkgname")
provides=("$_pkgname")
install=$pkgname.install
source=(
  "https://github.com/Benjamin-Dobell/Heimdall/archive/v${pkgver}.tar.gz"
  "$_pkgname.desktop"
  "$_pkgname.png"
  'cleanui.patch'
)
sha512sums=(
  '2f1f49b0ad7bd5f4359893359b26024fe0cce84afed3878e42d902eb4dee487a44e351247d57e4af143ad728abd6c664df688246fcf7b96b9f3841cd16594296'
  '457a5f6ec1ebf3e4c5b82e5d781ad47b4e3cfb3cadad6e6791cadc467a42a1a38c4684d424485d358d534536b76a82ee16b33c658f38fb5072f5a24f80ffcb92'
  '0f8cc17e5948cc57f457f178d443e0c2e2f54efcf9e1ac6981885fee8778d0de56ad50b8fbedb70c0e3fd86dc5beff69d759722253262270dcb7016136f1cca9'
  '9c0b6db2baf88d8eb4d80207ea80dba20933976f864f50cdd5337620b051eb72664530d6f67f4ed8b0aee61b5b12adf80eeca09071520848e4e2797df392cc77'
)

prepare() {
    cd Heimdall-$pkgver

    # Remove all that donation spam from the GUI
    # Please consider donating to the developer @ http://glassechidna.com.au/donate/
    patch -p1 < ../cleanui.patch
}

build() {
  cd Heimdall-$pkgver/libpit
  ./configure --prefix=/usr
  make

  cd ../$_pkgname
  ./configure --prefix=/usr
  sed -i 's|sudo service udev restart|echo sudo service udev restart|' Makefile # hack to keep the Makefile from incorrectly trying to restart udev
  make

  cd ../$_pkgname-frontend
  env OUTPUTDIR="/usr/bin" qmake-qt4 ${_pkgname}-frontend.pro
  sed -i 's|local\/||g' Makefile # hack to place ${_pkgname}-frontend in /usr/bin
  make
}

package() {
  msg 'Installing desktop files'
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  msg 'Installing LICENSE'
  cd Heimdall-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing heimdall'
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  msg 'Installing heimdall-frontend'
  cd ../$_pkgname-frontend
  make INSTALL_ROOT="$pkgdir" install
}
