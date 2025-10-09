# Maintainer: Amolith <amolith@secluded.site>

pkgname=go-prism-git
pkgver=v1.1.0.r22.g427afd5
pkgrel=1
pkgdesc='Turn raw test output into beautiful data'
arch=('x86_64' 'aarch64')
url='https://github.com/DaltonSW/prism'
license=('MIT')
install=.install
makedepends=('go' 'git')
provides=('go-prism')
conflicts=('go-prism' 'go-prism-bin')
source=("$pkgname::git+https://github.com/DaltonSW/prism.git#branch=main")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname" || exit
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "$pkgname"
  install -Dm755 prism "$pkgdir/usr/bin/go-prism"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
