# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=kcgi
pkgver=0.12.2
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom')
depends=('glibc')
makedepends=('bmake')
source=("https://kristaps.bsd.lv/kcgi/snapshots/$pkgname-$pkgver.tgz"
        "LICENSE")
sha512sums=('f28dd2134936036c44bbd3fc094e512c52019e0dc39f085a396924331c0e7f0bb940cee8afae43147674065b7d5a1d057c56cfdb0040131b72da53dff2289d31'
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
