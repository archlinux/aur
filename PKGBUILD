# Maintainer: aksr <aksr at t-com dot me>
pkgname=loksh-git
pkgver=6.6.r61.db365e4
pkgrel=2
epoch=
pkgdesc="A Linux port of OpenBSD's ksh."
arch=('i686' 'x86_64')
url="https://github.com/dimkr/loksh"
license=('publicdomain')
groups=()
depends=('libbsd')
makedepends=('git' 'meson')
optdepends=()
checkdepends=()
provides=('loksh')
conflicts=('loksh')
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/dimkr/loksh.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed 's/-.*//g')" \
                     "$(git rev-list --count HEAD)" \
                     "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  meson --prefix /usr . build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR=$pkgdir ninja -C build install
  mv $pkgdir/usr/bin/ksh $pkgdir/usr/bin/${pkgname%-*}
  mv $pkgdir/usr/share/man/man1/ksh.1 $pkgdir/usr/share/man/man1/${pkgname%-*}.1
  mkdir -p $pkgdir/usr/share/licenses/${pkgname%-*}
  mv $pkgdir/usr/share/doc/${pkgname%-*}/LEGAL $pkgdir/usr/share/licenses/${pkgname%-*}/LEGAL
}

