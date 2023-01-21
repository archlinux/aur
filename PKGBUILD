# Contributor: Stephen Gregoratto <dev@sgregoratto.me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gmenu-git
pkgver=0.3.0.r4.gab24782
pkgrel=3
pkgdesc="desktop application launcher"
url="https://code.rocketnine.space/tslocum/gmenu"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go')
conflicts=('gmenu')
provides=('gmenu')
depends=('gtk4' 'gobject-introspection-runtime')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's+-+.r+' | tr - . | cut -c2-
}

build() {
  cd "${pkgname%-git}"
  mkdir -p "build"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build ./cmd/...
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 build/gmenu "$pkgdir/usr/bin/gmenu"
  install -Dm755 build/gtkmenu "$pkgdir/usr/bin/gtkmenu"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
