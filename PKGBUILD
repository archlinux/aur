# Maintainer: Gavin Beatty <public at gavinbeatty dot com>
_pkgname=udptunnel
pkgname=$_pkgname-lennox
pkgver=1.1
pkgrel=1
pkgdesc="Tunnel UDP packets over a TCP connection."
provides=($_pkgname)
conflicts=($_pkgname)
arch=(i686 armv6h armv7h aarch64 x86_64)
url=https://web.archive.org/web/20200308053857/http://www.cs.columbia.edu/~lennox/udptunnel/
license=(BSD)
makedepends=(gcc)
source=(https://web.archive.org/web/20200308053857/http://www.cs.columbia.edu/~lennox/udptunnel/udptunnel-1.1.tar.gz
        01-multicast.diff
        02-strlen-prototype.diff
        udptunnel.1)
sha256sums=('a3ceeadc80d5a43a4a93dc068189ccf7a59b9f3bd6d79e0aaa54d75ae1605f26'
            'e69f8bf85e5650bea7552e5e4f208556913f157deb830c1d97fe9657fb312ab5'
            '2a6aefd5f0fe1c44bd5cb2a2fb20de4170ef80a4a440119d2f5bf0e5960c3bb8'
            '1bd6dac75ddb2df646761ef493e26db4ef76ad0dc3381f04d0b6cffeeafaa5cb')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch --forward --strip=1 --input="$srcdir/01-multicast.diff"
  patch --forward --strip=1 --input="$srcdir/02-strlen-prototype.diff"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m 0644 COPYRIGHT "$pkgdir/usr/share/licenses/$_pkgname/COPYRIGHT"
  install -D -m 0644 udptunnel.html "$pkgdir/usr/share/doc/$_pkgname/udptunnel.html"
  install -D -m 0644 "$srcdir/udptunnel.1" "$pkgdir/usr/share/man/man1/udptunnel.1"
}
