# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Leonardo A. Gallego <leonardo@archlinux-es.org>

pkgname=chgrep
pkgver=1.2.5
pkgrel=2
pkgdesc="Fast pattern replacement utility, grep style"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/jose1711/chgrep"
license=('GPL-2.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('86b45d62a87a01384a0e284fd458cc9e9b181a9c3ab99dd468b6f86795d33cf0')

prepare() {
  cd "$pkgname-$pkgver"
  # upstream tarball ships compile/depcomp as symlinks into
  # /usr/share/automake-1.16, which do not exist on current systems
  rm -f compile depcomp
  # fix build with -Werror=format-security
  sed -i 's/syslog(level, buf);/syslog(level, "%s", buf);/' src/error.c
  autoreconf -fi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
