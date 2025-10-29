# Maintainer: Amolith <amolith@secluded.site>

pkgname=ggc-git
pkgver=r602.2ceb3bc
pkgrel=1
pkgdesc="A modern Git CLI tool with both traditional command-line and interactive incremental-search UI"
arch=('x86_64' 'aarch64')
url="https://github.com/bmf-san/ggc"
license=('MIT')
provides=('ggc')
conflicts=('ggc' 'ggc-bin')
makedepends=('git' 'go')
source=('git+https://github.com/bmf-san/ggc.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ggc" || exit
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/ggc"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$srcdir/ggc"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  make build
}

package() {
  cd "$srcdir/ggc"
  install -Dm755 ggc "$pkgdir"/usr/bin/ggc
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
