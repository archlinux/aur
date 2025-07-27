# Maintainer: tarball <bootctl@gmail.com>

pkgname=sish
pkgver=2.20.0
pkgrel=1
pkgdesc='HTTP(S)/WS(S)/TCP Tunnels to localhost using only SSH'
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url='https://github.com/antoniomika/sish'
license=('MIT')
depends=('glibc' 'openssh')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f9ffefefe07f6d2c7b7f75885e748dee3dd63024242ca22f115c85259acc7d9')
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
