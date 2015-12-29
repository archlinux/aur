#Maintainer: M0Rf30

pkgname=i2pd-git
pkgver=2135.2cc3dfc
pkgrel=1
pkgdesc="Simplified C++ implementation of I2P client"
arch=('i686' 'x86_64')
url="https://github.com/PurpleI2P/i2pd"
license=('GPL2')
depends=('boost-libs' 'miniupnpc' 'openssl' 'zlib')
makedepends=('git' 'boost' 'cmake')
source=('i2pd::git+https://github.com/PurpleI2P/i2pd.git'
	i2pd.service
	i2p.conf
	i2pd.tmpfiles.conf)
install=i2pd.install
backup=(var/lib/i2pd/i2p.conf)

build() {
  cd i2pd/build
  mkdir tmp
  cd tmp
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DWITH_BINARY=ON -DWITH_LIBRARY=ON -DWITH_UPNP=ON ..
  make
}

package(){
  cd i2pd/build/tmp
  make DESTDIR=$pkgdir install  


  install -Dm0644 $srcdir/i2pd.service $pkgdir/usr/lib/systemd/system/i2pd.service
  install -Dm0644 $srcdir/i2p.conf $pkgdir/var/lib/i2pd/i2p.conf
  install -Dm0644 $srcdir/i2pd.tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/i2pd.conf
}

pkgver() {
  cd i2pd
  echo $(git rev-list --count openssl).$(git rev-parse --short openssl)
}

md5sums=('SKIP'
         '7125bfdcbb5050c5fbf7531861dc82fa'
         'b145e41e22806bd4ca4f4064ec4721a2'
         '862be388708f2b1bd5f727715ec7508d')
