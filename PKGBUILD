# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=sqawk-git
pkgver=20160510
pkgrel=1
pkgdesc="Like Awk but with SQL and table joins"
arch=('i686' 'x86_64')
depends=('sqlite-tcl' 'tcl' 'tcllib')
makedepends=('git')
url="https://github.com/dbohdan/sqawk"
license=('MIT')
source=(git+https://github.com/dbohdan/sqawk)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -dpr --no-preserve=ownership examples \
    "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  make prefix=/usr DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
