# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
pkgname=llmnrd-git
pkgver=0.7.r6.gc1e7429
pkgrel=1
pkgdesc="Link-Local Multicast Resolution Daemon"
arch=('i686' 'x86_64')
url="https://github.com/tklauser/llmnrd"
license=('GPL2')
makedepends=('git' 'patch')
source=("${pkgname%-git}::git+https://github.com/tklauser/llmnrd.git"
	'llmnrd-sbin.patch'
        'llmnrd.service')
sha256sums=('SKIP'
            '3a4b13580c7119a2d267d60235ace8a21ad460848da1446ee8c3f75569633cd2'
            '25d4b95f21112bee6eb9fce3c24bd460af5cbe9d1fcfefda7a0509527020334e')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -p1 -i "$srcdir/llmnrd-sbin.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" CFLAGS="$CFLAGS" prefix="/usr" install
  install -D -m0644 "$srcdir/llmnrd.service" "$pkgdir/usr/lib/systemd/system/llmnrd.service"
}
