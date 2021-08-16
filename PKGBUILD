# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cod
pkgver=0.1.0
pkgrel=2
pkgdesc="A completion daemon for bash/zsh"
arch=('any')
url="https://github.com/dim-an/cod"
license=('Apache')
makedepends=('go')
optdepends=('bash-completion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dim-an/cod/archive/v$pkgver.tar.gz")
sha256sums=('3d8ed6f284afcf4c86a2164e234ab7ff40c50aa6ab0bd892e59f8dc8aef02541')

prepare() {
  # Prevent creation of a `go` directory in one's home.
  # Sometimes this directory cannot be removed with even `rm -rf` unless
  # one becomes root or changes the write permissions.
  export GOPATH="$srcdir/gopath"
  go clean -modcache
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "${pkgname%-git}" .

  # Clean now to ensure makepkg --clean works
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
