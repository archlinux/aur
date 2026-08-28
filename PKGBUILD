# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=tailcat-git
pkgver=c04c5afee
pkgrel=2
pkgdesc="like netcat, but over Tailscale's data plane, without Tailscale's control plane"
url='https://github.com/tailscale/tailcat'
arch=(aarch64 x86_64)
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git go)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --always | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$pkgname/cmd/${pkgname%-git}"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname/cmd/${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "${pkgname%-git}" .
}

package() {
  cd "$pkgname"
  install -Dm755 "cmd/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  go clean -modcache
}

