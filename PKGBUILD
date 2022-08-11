# Maintainer: Andy Alt <andy400-dev at yahoo dot com>
# Contributor: Evgeny Grablyk <evgeny.grablyk@gmail.com>

pkgname=vfu
pkgver=4.23
pkgrel=2
pkgdesc="Versatile text-based file-manager"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="http://cade.noxrun.com/projects/vfu"
license=('GPL')
depends=('ncurses' 'pcre2')
optdepends=('perl: for the rx_* archiving utilities'
            'rpmextract: for rx_rpm'
            'unrar: for rx_rar'
            'unzip: for rx_zip')
backup=('etc/vfu.conf' 'etc/vfu/vfu.conf')
source=("http://cade.noxrun.com/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cb118813fd9b629731e96d70098319193b3415aa60e796596bacc6c482960779')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp ../../pcre2_parallel.patch .
  patch -p1 < pcre2_parallel.patch
  make CCDEF="$CFLAGS -D_FILE_OFFSET_BITS=64"
  ./build.docs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 vfu/vfu -t "$pkgdir/usr/bin"
  gzip vfu.1
  install -Dm644 vfu.1.gz -t "$pkgdir/usr/share/man/man1"
  install -Dm644 vfu.conf -t "$pkgdir/etc"
  install rx/rx_* "$pkgdir/usr/bin/"
}

