# Maintainer: Patrick Hanft <aur at patrick-hanft dot de>
# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>
pkgname=oui
pkgver=2.0.6
pkgrel=2
pkgdesc='MAC Address CLI Toolkit'
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://github.com/thatmattlove/$pkgname"
license=('BSD-3-Clause-Clear')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33d7aecf62b0b61e20801c298e60e4c59c564bae40367bf0b379b71d5f425a9a')

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
  if [[ "$CARCH" == "i686" ]]; then
  	export GO386=softfloat
  fi
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test ./... -skip 'Test_New'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
