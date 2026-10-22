# Maintainer: Martin Fritzsche <aur at mafri dot org>
pkgname=snmpscan
pkgver=2.1.0
pkgrel=1
pkgdesc="CLI-Tool to monitor routers and switches by SNMP"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/mafri27/snmpscan"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ebf7a07fa03ac8d7db95e95fe41bf74d61a1b835b24f030b33f6970f22d2fa5')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o snmpscan ./cmd/snmpscan
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 snmpscan "$pkgdir/usr/bin/snmpscan"
  install -Dm644 -t "$pkgdir/etc/snmpscan/" .snmpscan/*.device
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md snmpscan.yml.example
}

# vim:set ts=2 sw=2 et:
