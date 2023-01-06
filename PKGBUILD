# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
pkgname=gophercap
pkgver=0.3.1
pkgrel=1
pkgdesc='Accurate, modular, scalable PCAP manipulation tool written in Go.'
arch=('x86_64')
url="https://github.com/StamusNetworks/gophercap"
license=('Apache')
makedepends=('go' 'libpcap')
source=("https://github.com/StamusNetworks/gophercap/archive/v$pkgver.tar.gz")
sha256sums=('a737c825dcef1b125432827be4f8ee9f3f2705d370125bc0289205005b47edd6')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go get -u ./
  go build -ldflags="-X 'gopherCap/cmd.Version=$pkgver'" -o ./$pkgname ./
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}
