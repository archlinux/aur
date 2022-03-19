# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=pwsafe
pkgver=r5.3e23fa2
pkgrel=1
pkgdesc="A commandline program for managing encrypted password databases"
arch=('x86_64')
url="https://github.com/nsd20463/pwsafe"
license=('GPL')
depends=('openssl' 'libxmu')
makedepends=('git')
source=(git+https://github.com/nsd20463/pwsafe)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/${pkgname}
}

build() {
  cd "$srcdir"/${pkgname}
  aclocal
  autoheader
  automake --add-missing
  autoconf
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir"/${pkgname}
  make DESTDIR="$pkgdir" install
  # Make pwsafe suid root so it can seed rng as a user
  chmod +s "$pkgdir"/usr/bin/pwsafe
}
