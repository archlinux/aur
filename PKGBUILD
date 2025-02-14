# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=actionlint-git
pkgver=r1464.0a5b35d
pkgrel=2
pkgdesc="Static checker for GitHub Actions workflow files"
arch=('any')
url="https://github.com/rhysd/actionlint"
license=('MIT')
makedepends=('go' 'git')
optdepends=('python-pyflakes' 'shellcheck')
source=("git+${url}.git")
provides=('actionlint')
conflicts=('actionlint')
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${pkgname/-git/}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${pkgname/-git/}"
  mkdir -p build/
}

build() {
  cd "${pkgname/-git/}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/${pkgname/-git/}
}

# check() {
#   cd "${pkgname/-git/}"
#   go test -v ./...
# }

package() {
  cd "${pkgname/-git/}"
  install -Dm755 build/${pkgname/-git/} "$pkgdir"/usr/bin/${pkgname/-git/}
}
