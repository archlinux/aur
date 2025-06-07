# Maintainer: Keith Connolly <streek@mesaro.com>
pkgname=go-weather
pkgver=1.0.1
pkgrel=1
pkgdesc="Console-based weather application"
arch=('x86_64' 'aarch64')
url="https://github.com/streek/go-weather"
license=('GPL3')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/go-weather-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  # Read version and inject it during build
  VERSION=$(cat VERSION)
  go build -ldflags "-X 'main.appVersion=$VERSION'" -o go-weather .
}

package() {
  cd "$srcdir/go-weather-$pkgver"
  install -Dm755 go-weather "$pkgdir/usr/bin/go-weather"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
