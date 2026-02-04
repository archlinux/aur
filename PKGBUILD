# Maintainer: tarball <bootctl@gmail.com>

pkgname=sish
pkgver=2.21.1
pkgrel=1
pkgdesc='HTTP(S)/WS(S)/TCP Tunnels to localhost using only SSH'
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url='https://github.com/antoniomika/sish'
license=('MIT')
depends=('glibc' 'openssh')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c69a7542ad4135cf5f408f533e4767e6a6e8e6ab4cdbd97e3dc004f7dec3b045')
install="$pkgname.install"

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o $pkgname .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  for dir in deploy templates; do
    install -dm755 "$pkgdir/usr/share/$pkgname/$dir/"
    cp -av $dir/. "$pkgdir/usr/share/$pkgname/$dir/"
  done
}
