# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname=nuclei-git
pkgver=3.6.2.r158.g6eda56f38
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
  go build -ldflags "-compressdwarf=false -linkmode external" ./cmd/nuclei
  go build ./cmd/docgen
  ./docgen docs.md nuclei-jsonschema.json
}

package() {
  cd nuclei
  install -Dm0755 nuclei "$pkgdir/usr/bin/nuclei"
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 docs.md "$pkgdir/usr/share/doc/$pkgname/docs.md"
}

# vim: ts=2 sw=2 et:
