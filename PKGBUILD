# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=doctree
pkgver=r62.98639ba
pkgrel=1
pkgdesc='First-class library docs tool for every language'
arch=('x86_64')
url='https://github.com/sourcegraph/doctree'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go' 'nodejs' 'npm')
options=('!lto')
_commit='98639ba60c4bab37b38b6a75c0715c4dddb9e83a'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$pkgname"

  mkdir build

  go mod download
}

build() {
  cd "$pkgname"

  # install frontend deps
  pushd frontend
  npm init -y
  npm install elm elm-spa

  # generate frontend
  npx elm-spa gen
  mkdir -p public/dist/
  npx elm make .elm-spa/defaults/Main.elm --output ./public/dist/elm.js

  popd

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    ./cmd/...
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" build/doctree
}
