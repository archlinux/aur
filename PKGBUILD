# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cod-git
pkgver=0.1.0.r9.gfdbe85a
pkgrel=1
pkgdesc="A completion daemon for bash/zsh"
arch=('x86_64')
url="https://github.com/dim-an/cod"
license=('Apache-2.0')
depends=('glibc')
makedepends=(
  'git'
  'go'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dim-an/cod.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export GOPATH="$srcdir/gopath"

  # download dependencies
  go mod download -x

  # create directory for build output
  mkdir -p build
}

build() {
  cd "${pkgname%-git}"
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
  cd "${pkgname%-git}"
  install -Dm755 "build/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
