pkgname=volnoti-dbus
pkgver=0.0.1
pkgrel=1
pkgdesc='Subscribe to pulseaudio DBUS API, and display a libnotify notification when volume changes.'
arch=('x86_64')
url="https://github.com/jbonachera/volnoti-dbus"
license=('GPL')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('62f7f56c42c7ce2645539bee82cf7ec898798f90a88902c3f845a4566d8775b6')

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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
