# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jemalloc-git
pkgver=5.3.0.r60.g5f64ad60
pkgrel=1
pkgdesc="General purpose malloc implementation"
arch=('i686' 'x86_64')
url="https://jemalloc.net/"
license=('BSD')
depends=('glibc' 'sh')
makedepends=('git' 'docbook-xsl')
optdepends=('perl: for running jeprof')
provides=("jemalloc=$pkgver")
conflicts=('jemalloc')
source=("git+https://github.com/jemalloc/jemalloc.git")
sha256sums=('SKIP')


pkgver() {
  cd "jemalloc"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jemalloc"

  _xslroot="/usr/share/xml/docbook/xsl-stylesheets-$(pacman -Q docbook-xsl | cut -d ' ' -f 2 | cut -d '-' -f 1)"
  ./autogen.sh \
    --prefix="/usr" \
    --with-xslroot="$_xslroot"
  make
}

check() {
  cd "jemalloc"

  make check
}

package() {
  cd "jemalloc"

  make dist
  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/jemalloc"

  find "$pkgdir" -name \*.a -type f -exec chmod 644 '{}' \;
}
