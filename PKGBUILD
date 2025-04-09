# Maintainer: willemw <willemw12@gmail.com>
# Contributor: gt <AT> notfoss.com
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=lnav-git
pkgver=0.13.0.beta4.r19.gcdf0cd6
pkgrel=1
pkgdesc='A curses-based tool for viewing and analyzing log files'
arch=(x86_64)
url=http://lnav.org
license=(BSD-2-Clause)
depends=(curl openssh pcre sqlite3 wireshark-cli) # gpm
makedepends=(cargo git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/tstack/lnav.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 --match='v[0-9]*' --match='[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

  make -C $pkgname DESTDIR="$pkgdir/" install
}
