pkgname="clover"
pkgver=1.1
pkgrel=1
pkgdesc="Clover is a lightweight, fast, leech-only torrent client written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/JoelVCrasta/clover-torrent"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d0659d3aebfcc2e79166df7c343fa255fa295768dff020f7be6a6bdb440f598')

prepare() {
    cd "clover-torrent-$pkgver"
    mkdir -p build
}

build() {
    cd "clover-torrent-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build/"$pkgname" .
}

package() {
  cd "clover-torrent-$pkgver"

  install -Dm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
