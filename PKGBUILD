# Maintainer: Anatol Pomozov

pkgname=cartridge-cli
pkgrel=1
pkgver=2.12.3
pkgdesc='Tarantool Cartridge command-line utility'
arch=(x86_64)
url="https://tarantool.io/"
license=(BSD)
options=(!lto) # due to go 'relocation target _cgo_yield not defined' error
depends=(glibc)
makedepends=(go mage)
source=(cartridge-cli-$pkgver.tar.gz::https://github.com/tarantool/cartridge-cli/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('d279434020a1980e87034c203d1c48be065756a6d76066eca60457587f84a18c')

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
