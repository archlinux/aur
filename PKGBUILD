# Maintainer: Nathanael Bonfim <dev@nathabonfim59.com>
pkgname=gitid-git
pkgver=1.2.0
pkgrel=1
pkgdesc="Git Identity Manager - A tool to manage multiple git identities"
arch=('x86_64' 'aarch64')
url="https://github.com/nathabonfim59/gitid"
license=('MIT')
depends=('glibc')
optdepends=('git: required for git identity management')
makedepends=('go')
conflicts=('gitid-bin')
provides=('gitid')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "gitid-$pkgver"
  export CGO_LDFLAGS="$LDFLAGS -Wl,-z,shstk"
  export CGO_CFLAGS="$CFLAGS -fcf-protection"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS -fcf-protection"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -ldflags "-linkmode external -extldflags '$LDFLAGS -Wl,-z,shstk' -X main.version=$pkgver" -o build/gitid .
}

package() {
  cd "gitid-$pkgver"

  # Install binary
  install -Dm755 build/gitid "$pkgdir/usr/bin/gitid"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
