# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=mini
pkgver=r34.0ee8bd7
pkgrel=1
pkgdesc="Stripped down lead version of aewm++"
arch=(x86_64 i686)
url="https://github.com/frankhale/mini"
license=('GPL3')
depends=('gcc-libs' 'libxext' 'json-c')
makedepends=('gendesk>=0.6' 'git' 'clang')
source=("$pkgname::git+https://github.com/frankhale/mini.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name Mini
  gendesk -f -wm --pkgname "${pkgname}_kdm" --exec "$pkgname" --name Mini
}

build() {
  cd $pkgname
  make ADDITIONAL_CFLAGS="-std=c++1y"
}

package() {
  cd $pkgname
  install -Dm755 "mini" "$pkgdir/usr/bin/mini"
  install -Dm644 "$srcdir/${pkgname}.desktop" \
    "$pkgdir/usr/share/xsessions/${pkgname}.desktop"
  install -Dm644 "$srcdir/${pkgname}_kdm.desktop" \
    "$pkgdir/usr/share/apps/kdm/sessions/${pkgname}_kdm.desktop"
}

