# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=jd-tool
_pkgname=jd
pkgver=1.7.0
pkgrel=1
pkgdesc="JSON diff and patch"
arch=(x86_64 aarch64)
url="https://github.com/josephburnett/jd"
license=(MIT)
makedepends=(go)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d23e67e1ff6a3752a558bcc00e76cf270189b8a39569cca3aebfe0b172c32d43')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  mkdir -p build/

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o build/jd main.go
}

check() {
  cd "$_archive"

  go test ./lib/...
}

package() {
  cd "$_archive"

  install -Dm755 "build/jd" "$pkgdir/usr/bin/jd"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/jd/LICENSE"
}
