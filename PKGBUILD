# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Andrey Korobkov <korobkov@fryxell.info>

pkgname=csprng
pkgver=1.1.3
pkgrel=8
pkgdesc="Cryptographically Secure Pseudorandom Number Generator"
license=("GPL3")
arch=("i686" "x86_64")
Documentation=("man:csprngd(8)" "https://code.google.com/p/csrng")
depends=('openssl-1.0')
url="https://code.google.com/archive/p/csrng/"
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/csrng/$pkgname-$pkgver.tar.bz2"
	"csprngd.service")

sha256sums=('522882e255a013d24a3c2dd639b69380ecd6b48b549e1ea345dd385e889e051b'
            'e8516dc15ec99c154c96eec03f794d2fc7346282913aef587f76b0471f9f11e5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  export CFLAGS+=" -I/usr/include/openssl-1.0"
  export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-openssl=/usr/lib/openssl-1.0
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/${pkgname}d.service" "$pkgdir/usr/lib/systemd/system/${pkgname}d.service"
}

