# Maintainer: Yeaxi <https://ahji60164@gmail.com>
_pkgname="butterfish"
pkgname="${_pkgname}-git"
pkgver=0.2.15.r1.geb6d52c1
pkgrel=1
pkgdesc='A shell with AI superpowers'
arch=('x86_64')
# url="https://example.org/$pkgname"
url="https://github.com/bakks/butterfish"
license=('MIT')
makedepends=('go')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pick_mr() {
  cd ${srcdir}/${_pkgname}
  git pull origin pull/$1/head --no-edit
}

prepare() {
  # Pick pull request form github using `pick_mr <pull request numebr>`.
  # e.g. `pick_mr 100`
  echo -n
}

pkgver() {
  cd ${srcdir}/${_pkgname}

  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' |
    sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  mkdir -p build/
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
