# Maintainer:  Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=s6-musl
_pkgname=${pkgname%-musl}
pkgver=2.11.3.2
pkgrel=1
pkgdesc="skarnet's small supervision suite."
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/$_pkgname"
license=('custom:ISC')
makedepends=('execline-musl>=2.9.3.0' 'skalibs-musl>=2.13.1.1' 'musl')
provides=($_pkgname=$pkgver)
options=('staticlibs')
source=("${url}/$_pkgname-$pkgver.tar.gz")
sha256sums=('7c16138ad2f0ffbe0ed2ae8dd0cecada9f7c787edd33a69084d219110693df74')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC="musl-gcc"
  ./configure --enable-static-libc --bindir=/usr/bin --sbindir=/usr/bin --libexecdir=/usr/lib/$_pkgname
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
