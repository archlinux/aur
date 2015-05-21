pkgname=pump
pkgver=0.8.24
_pkgrel=7
pkgrel=10
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="BootP and DHCP client"
makedepends=('libnewt')
depends=('glibc')
source=(http://cdn.debian.net/debian/pool/main/p/pump/pump_${pkgver}.orig.tar.gz
        http://cdn.debian.net/debian/pool/main/p/pump/pump_${pkgver}-${_pkgrel}.diff.gz)
md5sums=('866fc9f62b8161eb1514a6a06597edc9'
         '29b66e30daaccb1ec34123e292aa36b4')
url="http://packages.debian.org/wheezy/pump"

prepare() {
  cd "$pkgname-$pkgver"

  sed -i -e 's|install -m 755 netconfig $(USRSBINPATH)/netconfig||g' "$srcdir/pump-$pkgver/Makefile"
  patch -Np1 -i "$srcdir/pump_${pkgver}-${_pkgrel}.diff"

  for i in $(ls debian/patches/*.patch* | sort); do
    patch -p1 -s -i $i
    if [ $? = 0 ]; then
      echo "$i applied"
    else
      echo "Error processing $i"
      return 1
    fi
  done

  sed -i 's#-Wall -Werror ##g' "$srcdir/pump-$pkgver/Makefile"
}

build() {
  cd "$pkgname-$pkgver"

  make pump
}

package() {
  cd "$pkgname-$pkgver"

  RPM_BUILD_ROOT="$pkgdir/usr" sbindir="$pkgdir/usr/bin" libdir="$pkgdir/usr/lib" includedir="$pkgdir/usr/include" mandir="$pkgdir/usr/man" datadir="$pkgdir/usr/share" make install
}
