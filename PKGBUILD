# Maintainer: Anthony Vitacco <avitacco@protonmail.com>

pkgname=urga
pkgver=0.12.0
pkgrel=1
pkgdesc='Terminal UI for HashiCorp Nomad'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/ingvarch/urga'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f85cbfbc3a82f81151eb7fafc291519ac89d62358a976d5b4f296e756f8639ee')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  # Same version stamps goreleaser puts in a release build. The date comes from
  # SOURCE_DATE_EPOCH so the build is reproducible.
  local _date
  _date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +%Y-%m-%dT%H:%M:%SZ)
  local _pkg=github.com/ingvarch/urga/internal/version
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -o "$pkgname" \
    -ldflags "-linkmode=external -X $_pkg.Version=v$pkgver -X $_pkg.Date=$_date" \
    ./cmd/urga

  # The release ships the licenses of the linked modules alongside the binary.
  # This lists packages for every release platform, so it gets no -buildmode.
  go run -mod=readonly -modcacherw ./internal/licenses/cmd/licenses -notices THIRD_PARTY_NOTICES ./cmd/urga
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go test -mod=readonly -modcacherw ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE THIRD_PARTY_NOTICES -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
