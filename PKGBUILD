# Maintainer: linkfrg <linkfrg.dev@proton.me>
pkgname=goignis-git
_pkgname=goignis
pkgver=0.1.0.r0.g11cb083
pkgrel=1
pkgdesc="An optional, high-performance CLI for the Ignis widget framework"
arch=('x86_64')
url="https://github.com/ignis-sh/goignis"
license=('MIT')
makedepends=(go)
provides=('goignis')
conflicts=('goignis')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd $srcdir/$_pkgname
  mkdir -p build/
}

build() {
  cd $srcdir/$_pkgname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd $srcdir/$_pkgname
  go test ./...
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
