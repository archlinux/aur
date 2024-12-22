# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
_binaryname=netventory
pkgname=$_binaryname-git
pkgver=r2.9a71679
pkgrel=1
pkgdesc="Netventory is a fast single binary network scanning tool with a beautiful gui that runs on Linux, Mac or Windows"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/RamboRogers/netventory"
license=('MIT')
makedepends=(
  'go'
  'git'
)
source=("${pkgname}::git+https://github.com/RamboRogers/netventory.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Download dependencies
  go get -u
  go mod tidy

  # Build
  go build
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$_binaryname" "$pkgdir/usr/bin/netventory"
}
