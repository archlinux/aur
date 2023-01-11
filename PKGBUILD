# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: qs9rx <that nick at enjoys dot it>
# Contributor: David Manouchehri <d@32t.ca>

pkgname=dump1090-git
_pkgname=${pkgname%-git}
pkgver=r386.bff92c4
pkgrel=3
pkgdesc="A simple Mode S decoder for RTLSDR devices. MalcolmRobb fork."
arch=('x86_64' 'aarch64')
url="https://github.com/MalcolmRobb/dump1090"
license=('BSD')
depends=('rtl-sdr')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=(
  "$_pkgname::git+$url.git"
  "$_pkgname.patch")
sha256sums=(
  'SKIP'
  'c5d6c2de9326686f88c0beea8f2ea3539187bc2b6f654fcc921517d9ccbce514')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # gcc10 tweaks
  patch -p1 -i "$srcdir/$_pkgname.patch"

  sed -i 's#./public_html#/usr/share/dump1090/public_html#g' dump1090.h
}

build() {
  cd "$srcdir/$_pkgname"
  make clean
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "dump1090" "$pkgdir/usr/bin/dump1090"
  install -Dm755 "view1090" "$pkgdir/usr/bin/view1090"
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -dpr --no-preserve=ownership public_html testfiles tools "$pkgdir/usr/share/$_pkgname/"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md TODO
}
