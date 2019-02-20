# Maintainer: Cody Schafer <aur at codyps.com>

_pkgbase=theft
pkgname=${_pkgbase}
pkgver=0.4.5
pkgrel=1
pkgdesc="property-based testing for C"
arch=('i686' 'x86_64')
url="https://github.com/silentbicycle/theft"
license=('ISC')
depends=()
makedepends=()

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/silentbicycle/theft/archive/v${pkgver}.tar.gz"
  "file://0001-make-set-permissions-on-install.patch"
  "file://0001-rework-Makefile-to-allow-overriding-CFLAGS-when-pack.patch"
)
md5sums=('66f59577c150fdc00f93613fc3f3d628'
         'a81f45b73b9422adae3bde6e84781408'
         'b448670299f8a8f4a7ae72f451d67f92')
sha1sums=('5382bf7f0958ed9d9f6442cdb65cf0e3cbfff2e8'
          '9eba154e41ca3d72444e5c7865635b161ada59c4'
          '2cf316b13cd74e47857a0a6ad2574aab966d3de2')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 <"$srcdir/0001-make-set-permissions-on-install.patch"
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
