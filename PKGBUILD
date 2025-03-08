# Maintainer: Thomas Herrle <th-arch@pm.me>
pkgname=fabric-git
pkgver=r2173.ef2e985d
pkgrel=1
pkgdesc="An open-source framework for augmenting humans using AI"
arch=('x86_64')
url="https://github.com/danielmiessler/fabric"
license=('MIT')
depends=('go')
makedepends=('git')
provides=('fabric-ai')
conflicts=('fabric-ai')
source=("git+https://github.com/danielmiessler/fabric.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/fabric"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/fabric"
  git checkout ef2e985d3fb0508f2aa6150fa46bf348175578e8
}

build() {
  cd "$srcdir/fabric"
  # Create a local GOPATH to install the binary
  export GOPATH="$srcdir/gopath"
  mkdir -p "$GOPATH"
  # Use go install with the specific commit
  go install github.com/danielmiessler/fabric@ef2e985d3fb0508f2aa6150fa46bf348175578e8
}

package() {
  # Copy the binary from the GOPATH to the package directory
  install -Dm755 "$srcdir/gopath/bin/fabric" "$pkgdir/usr/bin/fabric"
  # Copy the license file
  cd "$srcdir/fabric"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
