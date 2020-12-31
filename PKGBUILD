# Maintainer: Mario Oenning <mo-son at mailbox dot org>

pkgname=rpms
pkgver=1.0.2
pkgrel=1
pkgdesc='Renoir power metrics server'
arch=('x86_64')
url="https://github.com/moson-mo/$pkgname"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d488752a70a73b5db1558cc13607c1ecee7afc273f1787c0184f4099f215fc76')

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

post_install() {
    systemctl enable --now rpms.service
}