# Maintainer: Cody Schafer <aur at codyps.com>

_pkgbase=theft
pkgname=${_pkgbase}
pkgver=0.4.4
pkgrel=1
pkgdesc="property-based testing for C"
arch=('i686' 'x86_64')
url="https://github.com/silentbicycle/theft"
license=('ISC')
depends=()
makedepends=()

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/silentbicycle/theft/archive/v${pkgver}.tar.gz"
  "file://0001-make-set-permisions.patch"
  "file://0001-rework-Makefile-to-allow-overriding-CFLAGS-when-pack.patch"
)
md5sums=('57da78694b1330bd8b1a7f0c938c3427'
         'c61ffb9686c82cd91614aaa39f960707'
         'b448670299f8a8f4a7ae72f451d67f92')
sha1sums=('8d633b82cb648dda648b762ad61f2d654020733d'
          '0bfeee432e5ce68ae277d1a9dafbdca9c8c1d294'
          '2cf316b13cd74e47857a0a6ad2574aab966d3de2')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 <"$srcdir/0001-make-set-permisions.patch"
  patch -Np1 <"$srcdir/0001-rework-Makefile-to-allow-overriding-CFLAGS-when-pack.patch"
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
