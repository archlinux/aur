# Maintainer: redfish <redfish@galactica.pw>

#_BUILD_QT_GUI=1 # comment out to unset

pkgbase=gostcoin-git
pkgname=('gostcoind-git')
if [ ! -z "$_BUILD_QT_GUI" ]
then
pkgname+=('gostcoin-qt-git')
fi

pkgver=v0.8.5.10.r44.g90ce779
pkgrel=1
pkgdesc="Coin based on GOST R 34.10 and GOST R 34.11-2012 with I2P support"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://gostcoin.i2p"
license=('MIT')
makedepends=('boost' 'cmake')

depends=('boost-libs' 'openssl-1.0')
if [ ! -z "$_BUILD_QT_GUI" ]
then
depends+=('qt5-base')
fi
optdepends=('i2pd: I2P network transport')

source=("${pkgbase%%-git}::git+https://github.com/GOSTSec/gostcoin"
        "gostcoind.service"
        "gostcoind.conf")
backup=("etc/gostcoind.conf")
install="${pkgbase%%-git}.install"


pkgver() {
  cd ${pkgbase%%-git}
  echo $(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd $srcdir/${pkgbase%%-git}/src

  make \
      OPENSSL_INCLUDE_PATH=/usr/include/openssl-1.0 \
      OPENSSL_LIB_PATH=/usr/lib/openssl-1.0 \
      -f makefile.unix
}

package_gostcoind-git(){
  cd $srcdir/${pkgbase%%-git}

  provides=('gostcoind')
  conflicts=('gostcoind')

  install -Dm755 $srcdir/${pkgbase%%-git}/src/gostcoind "$pkgdir/usr/bin/gostcoind"
  install -Dm0644 $srcdir/gostcoind.service $pkgdir/usr/lib/systemd/system/gostcoind.service
  install -Dm0644 $srcdir/gostcoind.conf $pkgdir/etc/gostcoind.conf

  install -Dm644 $srcdir/${pkgbase%%-git}/COPYING $pkgdir/${_share_dest}/licenses/${pkgbase%%-git}/LICENSE
}

package_gostcoin-qt-git(){
  cd $srcdir/${pkgbase%%-git}

  provides=('gostcoin-qt')
  conflicts=('gostcoin-qt')

  qmake DEFINES+=BOOST_ASIO_ENABLE_OLD_SERVICES \
      OPENSSL_INCLUDE_PATH=/usr/include/openssl-1.0 \
      OPENSSL_LIB_PATH=/usr/lib/openssl-1.0 \
  
  make

  install -Dm755 $srcdir/${pkgbase%%-git}/src/qt/gostcoin-qt "$pkgdir/usr/bin/gostcoin-qt"
}

md5sums=('SKIP'
         '5fd2ff66d55bdfcba99755bb7c88b7f0'
         'a2811c45f7bdbb9dc66775f6f897631e')
