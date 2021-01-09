# Maintainer: Mario Oenning <mo-son at mailbox dot org>

pkgname=rpms
pkgver=1.0.3
pkgrel=5
pkgdesc='Renoir power metrics server'
arch=('x86_64')
url="https://github.com/moson-mo/$pkgname"
license=('MIT')
makedepends=('go')
depends=('ryzen_smu')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('840ed0a39087d518d7dce234668c3150e2c98c56d33f72cdd6a0bae42c2fd9b1')
install=$pkgname.install

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
  export GOFLAGS="-buildmode=pie -trimpath"
  go build -o build -ldflags "-s -w"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname-$pkgver "$pkgdir"/usr/bin/$pkgname
  install -m755 -d ${pkgdir}/usr/lib/systemd/system
  install -m644 assets/$pkgname.service "$pkgdir"/usr/lib/systemd/system
}
