# Maintainer: lmartinez-mirror
pkgname=hilbish-git
_pkgname=${pkgname%-git}
pkgver=0.0.12.r5.g9cc9c4a
pkgrel=1
pkgdesc="A shell written in Go and extended with Lua"
arch=('x86_64')
url="https://github.com/hilbis/hilbish"
license=('MIT')
depends=('readline')
makedepends=('git' 'go>=1.16')
optdepends=('lua')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  cd "$pkgname"
  install -Dm 755 hilbish -t "$pkgdir/usr/bin/"
  install -Dm 644 preload.lua -t "$pkgdir/usr/share/$_pkgname/"
  install -Dm 644 .hilbishrc.lua -t "$pkgdir/usr/share/$_pkgname/"
  find libs -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/$_pkgname/{}" \;
  install -Dm 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
