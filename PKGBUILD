# Maintainer: libele <libele@disroot.org>
# Contributor: Gabriel Laskar <gabriel at lse dot epita dot fr>

_pkgname=oksh
pkgname=ksh-oksh
pkgver=7.8
pkgrel=1
pkgdesc='Ported version of ksh from OpenBSD'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url='https://github.com/ibara/oksh/'
license=('custom: Public Domain' 'ISC' 'BSD')
depends=('glibc' 'ncurses')
provides=('ksh' 'oksh')
conflicts=('ksh' 'ksh93' 'oksh')
backup=(etc/ksh.kshrc)
install=oksh.install
source=("https://github.com/ibara/oksh/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('3b30d5a1183b829590cc020d8ab87f22d288e98dc3fdf12feb7159536beaa950')

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr --enable-ksh # --enable-sh
  sed -n '/Copyright/,/PERFORMANCE/p' strtonum.c > ISC-LICENSE
  sed -n '/Copyright/,/SUCH DAMAGE./p' vis.c > BSD-LICENSE
  cat LEGAL > PUBLIC_DOMAIN-LICENSE
  make
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR=$pkgdir/ install

  install -Dm644 ksh.kshrc $pkgdir/etc/ksh.kshrc
  install -Dm644 ISC-LICENSE $pkgdir/usr/share/licenses/$_pkgname/ISC-LICENSE
  install -Dm644 BSD-LICENSE $pkgdir/usr/share/licenses/$_pkgname/BSD-LICENSE
  install -Dm644 PUBLIC_DOMAIN-LICENSE $pkgdir/usr/share/licenses/$_pkgname/PUBLIC_DOMAIN-LICENSE
}
