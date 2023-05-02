# Maintainer: Anatol Pomozov

pkgname=cartridge-cli
pkgrel=1
pkgver=2.12.5
pkgdesc='Tarantool Cartridge command-line utility'
arch=(x86_64)
url="https://tarantool.io/"
license=(BSD)
options=(!lto) # due to go 'relocation target _cgo_yield not defined' error
depends=(glibc)
makedepends=(go mage)
source=(cartridge-cli-$pkgver.tar.gz::https://github.com/tarantool/cartridge-cli/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('75a304b6445b7d30b917bf17d46e8498bd93177cec395f9e5596ae7b52d67ecb')

build() { 
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  mage build
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 ./cartridge "$pkgdir"/usr/bin/cartridge
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
