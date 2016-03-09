#Maintainer: Unknown

pkgname=i2pd
pkgver=2.5.0
pkgrel=1
pkgdesc="Simplified C++ implementation of I2P client"
arch=('i686' 'x86_64')
url="https://github.com/PurpleI2P/i2pd"
license=('BSD')
depends=('boost-libs' 'miniupnpc' 'openssl' 'zlib')
makedepends=('boost' 'cmake')
source=(https://github.com/PurpleI2P/${pkgname}/archive/${pkgver}.tar.gz
	i2pd.service
	i2pd.tmpfiles.conf)
install=i2pd.install
backup=(var/lib/i2pd/i2pd.conf
        var/lib/i2pd/tunnels.cfg)
conflicts=('i2pd')

build() {
  mkdir -p build.tmp
  cd build.tmp
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DWITH_LIBRARY=OFF -DWITH_UPNP=ON ../$pkgname-$pkgver/build
  make
}

package(){
  cd build.tmp
  make DESTDIR=$pkgdir install

  rm -r $pkgdir/usr/src  
  rm $pkgdir/usr/LICENSE  
  rm $pkgdir/usr/lib/libi2pd.a  

  install -Dm0644 $srcdir/i2pd.service $pkgdir/usr/lib/systemd/system/i2pd.service
  install -Dm0644 $srcdir/i2pd.tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/i2pd.conf
  install -Dm0644 $srcdir/$pkgname-$pkgver/debian/i2pd.conf $pkgdir/var/lib/i2pd/i2pd.conf
  install -Dm0644 $srcdir/$pkgname-$pkgver/debian/tunnels.conf $pkgdir/var/lib/i2pd/tunnels.cfg
  install -Dm0644 $srcdir/$pkgname-$pkgver/debian/subscriptions.txt $pkgdir/var/lib/i2pd/subscriptions.txt

  cd $srcdir/$pkgname-$pkgver/contrib
  _dest="$pkgdir/var/lib/$pkgname"
  find ./certificates -type d -exec install -d {} ${_dest}/{} \;
  find ./certificates -type f -exec install -Dm644 {} ${_dest}/{} \;

  # license
  install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # docs
  install -Dm644 $srcdir/$pkgname-$pkgver/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 $srcdir/$pkgname-$pkgver/docs/configuration.md "$pkgdir/usr/share/doc/$pkgname/configuration.md"

  #man
  install -Dm644 $srcdir/$pkgname-$pkgver/debian/i2pd.1 "$pkgdir/usr/share/man/man1/i2pd.1"

  chmod -R o= $pkgdir/var/lib/i2pd
}

md5sums=('c903156c7ac6a0d6b053670a55271bf5'
         '224068c31e48084645763408ebae83af'
         'acda29e5b46a0c9fade734a6a467b381')
