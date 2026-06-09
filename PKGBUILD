# Maintainer: Anthony Vitacco <avitacco@protonmail.com>

pkgname=jig
pkgver=1.2.0
pkgrel=5
pkgdesc='A tool for building and publishing Puppet modules'
arch=('x86_64' 'aarch64')
url='https://github.com/avitacco/jig'
license=('MIT' 'Apache-2.0')
makedepends=('go')
depends=('glibc')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5cba53386866ab6aed70ad6437274a3211b0dbadfc0cae889732c553bdb67620')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
