# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
pkgname=bootimus
pkgver=0.1.70
pkgrel=1
pkgdesc="A Complete enhanced version of the PXE server"
arch=('x86_64' 'aarch64')
url="https://github.com/garybowers/bootimus"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce5b17b3a83be38127d76579424e236ae0ba09aed713300898a18f2a6cc0b42d')

prepare() {
  cd "$pkgname-$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  sed -i 's/"version": "[^"]*"/"version": "$(VERSION)"/' distro-profiles.json
  sed -i 's/"version": "[^"]*"/"version": "$(VERSION)"/' tools-profiles.json
  cp distro-profiles.json internal/profiles/distro-profiles.json
  cp tools-profiles.json internal/tools/tools-profiles.json
  go build -ldflags="-linkmode=external -w -s -X $pkgname/internal/server.Version=$pkgver" -o "$pkgname" .

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

}

# vim: sw=2 ts=2 et:
