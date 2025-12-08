# Maintainer: Prasanth Baskar <bupdprasanth@gmail.com>

pkgname=dagger-git
pkgver=0.19.8
pkgrel=1
pkgdesc='A portable devkit for CI/CD pipelines'
arch=('x86_64')
url='https://dagger.io'
license=('Apache-2.0')
depends=('glibc')
conflicts=('dagger')
makedepends=('git' 'go')
options=('!lto' '!debug')
source=("$pkgname::git+https://github.com/dagger/dagger.git#tag=v$pkgver")
sha512sums=('SKIP')
b2sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  # create directory for build output
  mkdir -p build

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "$srcdir/$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}' \
    -X github.com/dagger/dagger/engine.Version=v$pkgver \
    -X github.com/dagger/dagger/engine.Tag=v$pkgver" \
    -o "$srcdir/$pkgname/build" \
    ./cmd/...
}

# TODO tests now require docker *kicks docker*
#check() {
#  cd "$pkgname"
#
#  go test -v ./...
#}

package() {
  cd "$srcdir/$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" build/dagger
}
