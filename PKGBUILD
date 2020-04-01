# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=kcgi
pkgver=0.11.0
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom')
depends=('glibc')
makedepends=('bmake')
source=("https://kristaps.bsd.lv/kcgi/snapshots/$pkgname-$pkgver.tgz"
        "LICENSE")
sha512sums=('4e6cb03d22dc0c301b709b52cf69452d3e0dfa37bc78dcce5683a5b8b8d8d5ee64b0edd94763a0b346e46486061dfc1da7202acfed21862d699cc9bcdbf6b8e6'
            'b040c157fe8b95a41a0375d2cd3cc4e6406a988ed5f337b0c6dd15f1ea08344196018a5c2353c2acfbde7858ca5e0f2bf00d1cc4890661effadf39e239a95520')
build() {
  cd $pkgname-$pkgver

  ./configure PREFIX=/usr MANDIR=/usr/share/man SBINDIR=/usr/bin LDFLAGS="${LDFLAGS}"

  # This is a bit hackish, but it manages to add the linker flags for kfcgi.
  # The "configure" script picks LDFLAGS from the environment, but then it
  # does not use the variable in the target ¯\_(ツ)_/¯
  echo 'LDADD_LIB_SOCKET += $(LDFLAGS)' >> Makefile.configure

  bmake
}

check() {
  cd $pkgname-$pkgver

  bmake regress
}

package() {
  cd $pkgname-$pkgver

  bmake DESTDIR="$pkgdir" install
  strip -x --strip-unneeded "${pkgdir}/usr/bin/kfcgi"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

