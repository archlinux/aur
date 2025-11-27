# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Mort Yao <soi@mort.ninja>

pkgname=posh
pkgver=0.14.2
pkgrel=1
pkgdesc="A stripped-down version of pdksh that aims for compliance with Debian's policy, and few extra features."
arch=('i686' 'x86_64')
url='https://salsa.debian.org/clint/posh'
license=('custom')
depends=('glibc')
install="$pkgname".install
source=(http://deb.debian.org/debian/pool/main/p/posh/posh_"$pkgver".tar.xz)
sha256sums=('a0941a3f489bd87e2a799b9e22ee29983779e240517a1507f90fa46621500c82')

# Silence warnings caused by old coding style.
CFLAGS+=' -Wno-old-style-declaration -Wno-old-style-definition'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  printf 'define(POSH_VERSION, %s)\n' "$pkgver" > acinclude.m4

  unset CPPFLAGS
  autoreconf -fi
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix="$pkgdir" bindir="$pkgdir/usr/bin" mandir="$pkgdir/usr/share/man" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
