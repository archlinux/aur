# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xmlstarlet-git
pkgver=r707.ga722816
pkgrel=1
pkgdesc="Tools to transform, query, validate and edit XML file"
arch=('i686' 'x86_64')
url="http://xmlstar.sourceforge.net/"
license=('MIT')
depends=('glibc' 'libxml2' 'libxslt')
makedepends=('git' 'fop' 'ghostscript')
provides=('xmlstarlet')
conflicts=('xmlstarlet')
source=("git+https://git.code.sf.net/p/xmlstar/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "code"

  autoreconf -fi
  LIBXSLT_PREFIX=/usr LIBXML_PREFIX=/usr \
    ./configure \
      --prefix="/usr" \
      --enable-build-docs
  make
}

check() {
  cd "code"

  make check
}

package() {
  cd "code"

  make DESTDIR="$pkgdir" install
  ln -s "xml" "$pkgdir/usr/bin/xmlstarlet"
  install -Dm644 "Copyright" -t "$pkgdir/usr/share/licenses/xmlstarlet"
}
