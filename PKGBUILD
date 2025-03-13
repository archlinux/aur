# Maintainer: Nathan Chere <git@nathachere.com.au>

pkgname=gwob
pkgver=0.1.0
pkgrel=1
pkgdesc="A Go-based overlay bar for Wayland to visualize percentage values"
arch=('x86_64')
url="https://gitlab.com/nathanchere/gwob"
license=('Apache')
depends=('glibc')
makedepends=('go>=1.24')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/nathanchere/gwob/-/archive/v$pkgver/gwob-v$pkgver.tar.gz")
sha256sums=('694f5da9281e65334779e9e8bcc6c6f35cb342ab77cc1989e67357ba014aa1bd')

prepare() {
  cd "$pkgname-v$pkgver/src"
  go mod download
}

build() {
  cd "$pkgname-v$pkgver/src"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o gwob
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 src/gwob "$pkgdir/usr/bin/gwob"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
