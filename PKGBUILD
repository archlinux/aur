# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname=nuclei-git
pkgver=3.6.2.r65.g8aa427a6e
pkgrel=1
pkgdesc="Fast and customizable vulnerability scanner, git version"
arch=(x86_64)
url="https://projectdiscovery.io/nuclei"
license=(MIT)
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go>=1.24.2'
)
optdepends=()
provides=("nuclei")
conflicts=("nuclei")
source=("git+https://github.com/projectdiscovery/nuclei")
b2sums=('SKIP')

pkgver() {
  cd nuclei
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd nuclei
  export GOPATH="$srcdir"
  mkdir -p build
  go mod download -modcacherw
}

build() {
  cd nuclei
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw'
  go build -ldflags "-compressdwarf=false -linkmode external" -o nuclei cmd/nuclei/main.go
}

package() {
  cd nuclei
  install -Dm0755 nuclei "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
