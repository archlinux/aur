# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cod-git
pkgver=0.1.0.r2.gde10c9b
pkgrel=3
pkgdesc="A completion daemon for bash/zsh"
arch=('any')
url="https://github.com/dim-an/cod"
license=('Apache-2.0')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dim-an/cod.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  export GOPATH="$srcdir/gopath"

  # download dependencies
  go mod download -x

  # create directory for build output
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build .

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 "build/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
