# Maintainer: Jiri Prochazka <ojirio@gmail.com>

pkgname=libfnr-git
pkgdesc="Format-preserving encryption (FPE), small cipher (< 128 bits), for anonymization."
pkgver=r105.400cf06
pkgrel=1
arch=(i686 x86_64)
url=http://cisco.github.io/libfnr/
license=(LGPL)
depends=(openssl)
makedepends=(git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=($pkgname::git+https://github.com/cisco/${pkgname%-*}.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  . bootstrap.sh
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/bin # exclude test binaries
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

