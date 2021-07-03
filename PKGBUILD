# Maintainer: willemw <willemw12@gmail.com>
# Contributor: gt <AT> notfoss.com
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=lnav-git
pkgver=0.10.0.beta1.r9.g4a11b737
pkgrel=1
pkgdesc="A curses-based tool for viewing and analyzing log files"
arch=('x86_64')
url="http://lnav.org/"
license=('custom:BSD')
depends=('curl' 'pcre' 'sqlite3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/tstack/lnav.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm644 $pkgname/README -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm644 $pkgname/"${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"

  make -C $pkgname DESTDIR="$pkgdir/" install
}

