# Maintainer: David Foucher <dev@tyjak.net>

pkgname=wego
pkgver=2.4
pkgrel=1
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('x86_64')
license=('ISC')
depends=('glibc')
makedepends=('go')
source=("wego-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('ded9c29e3c55e165d58315f827e9b1f056d801dddd8c5be8e37986a13b7d177e9a39d06fb665144704277106297b00b600391b983d22de4a13cb7088a7d217b6')

prepare() {
  cd wego-$pkgver
  export GOPATH="$srcdir/gopath"
  go mod download
}

build() {
  cd wego-$pkgver
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o wego .
  ./wego --man > wego.1
}

package() {
  cd wego-$pkgver
  install -Dm755 wego "$pkgdir"/usr/bin/$pkgname
  install -Dm644 wego.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
