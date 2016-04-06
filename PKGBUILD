# Maintainer: DonOregano <lars@foldspace.nu>

pkgname=safir-sdk-core
pkgver=6.1.1
pkgrel=1
pkgdesc="Safir SDK Core is a middleware and platform for creation of distributed soft real-time systems. It is Scalable, Reliable, Portable, and last but not least, it is Open!"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.safirsdkcore.com"
license=('GPL3')
groups=()
depends=('boost' 'unixodbc' 'qt5-base' 'cmake' 'python' 'mono' 'java-environment>=6' 'google-breakpad-git')
makedepends=('git' 'subversion' 'doxygen' 'graphviz')
install=install
source=('https://github.com/SafirSDK/safir-sdk-core/archive/6.1.1.tar.gz'
        'safir-sdk-core.tmpfiles')
sha1sums=('fa8af3019c3cff096e815cad4462ae32a55718d1'
          'b2ef06ef3614b2f7243556cb8a28e4856e0c9e7b')
backup=('etc/safir-sdk-core/typesystem.ini' 'etc/safir-sdk-core/logging.ini' 'etc/safir-sdk-core/locations.ini')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo .
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  ctest . --output-on-failure
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  #Create directories
  install -d -m 775 $pkgdir/var/lib/safir-sdk-core
  install -Dm644 "$srcdir/safir-sdk-core.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/safir-sdk-core.conf"

  # install assemblies into Mono's GAC
  for file in $pkgdir/usr/lib/safir-sdk-core/*.dll
  do
    gacutil -i $file -root "$pkgdir/usr/lib"
  done

  #install configuration in /etc/safir-sdk-core
  install -d -m 755 $pkgdir/etc/safir-sdk-core
  install -m 644 -t $pkgdir/etc/safir-sdk-core $pkgdir/usr/share/doc/safir-sdk-core/example_configuration/*.ini
}

