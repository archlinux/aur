# Maintainer: Cody Schafer <aur at codyps.com>

_pkgbase=theft
pkgname=${_pkgbase}
pkgver=0.4.3
pkgrel=1
pkgdesc="property-based testing for C"
arch=('i686' 'x86_64')
url="https://github.com/silentbicycle/theft"
license=('ISC')
depends=()
makedepends=('git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/silentbicycle/theft/archive/v${pkgver}.tar.gz"
  "file://0001-make-support-DESTDIR-setting-for-packaging.patch"
  "file://0001-make-set-permisions.patch"
)
md5sums=('SKIP' 'SKIP' 'SKIP')
sha1sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 <"$srcdir/0001-make-support-DESTDIR-setting-for-packaging.patch"
  patch -Np1 <"$srcdir/0001-make-set-permisions.patch"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/share/doc/$_pkgbase"
  for i in doc/*.md; do
    install -m644 "$i" "$pkgdir/usr/share/doc/$_pkgbase"
  done
}

# ex: sts=2:ts=2:sw=2:et
