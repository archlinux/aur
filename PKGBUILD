# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=dbdeployer-git
pkgver=2.5.0.r0.g9b8b626
pkgrel=1
pkgdesc="A tool that deploys MySQL database servers easily."
url='https://github.com/ProxySQL/dbdeployer'
arch=(aarch64 x86_64)
license=(Apache-2.0)
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
  cd "$pkgname"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags="-s -w -linkmode=external -X ${url#*//}/common.VersionDef=$pkgver" \
    -o "${pkgname%-git}"
}

package() {
  cd "$pkgname"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  go clean -modcache
}

