# Maintainer: Cody Schafer <aur at codyps.com>

_pkgbase=theft
pkgname=${_pkgbase}-git
pkgver=0.4.3.r25.g0619c2a
pkgrel=1
pkgdesc="property-based testing for C"
arch=('i686' 'x86_64')
url="https://github.com/silentbicycle/theft"
license=('ISC')
depends=()
makedepends=('git')
provides=($_pkgbase)
conflicts=($_pkgbase)

source=(
  "$pkgname::git+https://github.com/silentbicycle/theft.git#branch=develop"
  "file://0001-make-support-DESTDIR-setting-for-packaging.patch"
  "file://0001-make-set-permisions.patch"
)
md5sums=('SKIP' 'SKIP' 'SKIP')
sha1sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname}"
  patch -Np1 <"$srcdir/0001-make-support-DESTDIR-setting-for-packaging.patch"
  patch -Np1 <"$srcdir/0001-make-set-permisions.patch"
}

build() {
  cd "$srcdir/${pkgname}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/share/doc/$_pkgbase"
  for i in doc/*.md; do
    install -m644 "$i" "$pkgdir/usr/share/doc/$_pkgbase"
  done
}

# ex: sts=2:ts=2:sw=2:et
