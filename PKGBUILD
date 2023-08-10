pkgname=shell2http-git
pkgver=1.3.r335.g28c2f05
pkgrel=1
pkgdesc="Executing shell commands via HTTP server"
arch=("x86_64")
url="https://github.com/msoap/shell2http"
license=("MIT")
makedepends=("go" "git")
depends=("glibc")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    set -o pipefail
    git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/shell2http"
  mkdir -p build/
}

build() {
  cd "${srcdir}/shell2http"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -o build ./...
  gzip --force shell2http.1
}

package() {
  cd "${srcdir}/shell2http"
  install -Dm755 build/shell2http "${pkgdir}/usr/bin/shell2http"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 shell2http.1.gz -t "${pkgdir}/usr/share/man/man1"
  go clean -modcache
}
