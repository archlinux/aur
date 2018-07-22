# Maintainer: redfish <redfish@galactica.pw>

_BUILD_QT_GUI=1 # comment out to unset

pkgbase=gostcoin-git
pkgname=('gostcoind-git')
if [ ! -z "$_BUILD_QT_GUI" ]
then
pkgname+=('gostcoin-qt-git')
fi

pkgver=0.8.5.12
pkgrel=2
pkgdesc="Coin based on GOST R 34.10 and GOST R 34.11-2012 with I2P support"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://gostcoin.i2p"
license=('MIT')
makedepends=('boost' 'cmake')

depends=('boost-libs' 'openssl')
if [ ! -z "$_BUILD_QT_GUI" ]
then
depends+=('qt5-base')
fi
optdepends=('i2pd: I2P network transport')

source=("${pkgbase%%-git}::git+https://github.com/GOSTSec/gostcoin"
        "gostcoind.service"
        "gostcoind.conf")


pkgver() {
  cd ${pkgbase%%-git}
  echo $(git describe --tags --long | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

prepare() {
  cd $srcdir/${pkgbase%%-git}
}

build() {
  cd $srcdir/${pkgbase%%-git}/src

  make -f makefile.unix
}

package_gostcoind-git(){
  cd $srcdir/${pkgbase%%-git}

  provides=('gostcoind')
  conflicts=('gostcoind')

  install="${pkgname%%-git}.install"

  backup=("etc/gostcoind.conf")

  install -Dm755 $srcdir/${pkgbase%%-git}/src/gostcoind "$pkgdir/usr/bin/gostcoind"
  install -Dm0644 $srcdir/gostcoind.service $pkgdir/usr/lib/systemd/system/gostcoind.service
  install -Dm0644 $srcdir/gostcoind.conf $pkgdir/etc/gostcoind.conf

  install -Dm644 $srcdir/${pkgbase%%-git}/COPYING $pkgdir/${_share_dest}/licenses/${pkgbase%%-git}/LICENSE
}

package_gostcoin-qt-git(){
  cd $srcdir/${pkgbase%%-git}

  provides=('gostcoin-qt')
  conflicts=('gostcoin-qt')

  qmake DEFINES+=BOOST_ASIO_ENABLE_OLD_SERVICES
  
  make

  install -Dm755 $srcdir/${pkgbase%%-git}/gostcoin-qt "$pkgdir/usr/bin/gostcoin-qt"
}

md5sums=('SKIP'
         '5fd2ff66d55bdfcba99755bb7c88b7f0'
         'a2811c45f7bdbb9dc66775f6f897631e')
