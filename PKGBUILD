# Maintainer: Kush Dhingra <kushdhingra3112@gmail.com>

pkgname=docket
pkgver=1.0.0
pkgrel=1
pkgdesc="A Terminal UI made for Docker :)"
arch=('x86_64')
url="https://github.com/thekushdhingra/docket"
license=('MIT')
depends=('docker')  # Only Docker is required at runtime
makedepends=('go' 'git')  # Go is only needed to build, Git is required for cloning
source=("git+https://github.com/thekushdhingra/docket.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/docket"
  git describe --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/docket"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o docket .
}

package() {
  cd "$srcdir/docket"
  install -Dm755 docket "$pkgdir/usr/bin/docket"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
