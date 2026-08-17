# Maintainer: w0rty <mawo97 at gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=wails
pkgver=2.14.0 # renovate: datasource=github-tags depName=wailsapp/wails
pkgrel=2
pkgdesc="Create desktop apps using Go and Web Technologies"
arch=(x86_64)
url="https://github.com/wailsapp/wails"
license=(MIT)
depends=('glibc' 'npm' 'gtk3')
makedepends=('go')
optdepends=('docker')
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('2c92f5e6802d5f2e7e4b15a6e87154125af6e0f75cc577630316a468db2293ad90227be0488088aa00cf8884cff32da2185e4a4de86b74b5de4b797bb6de1df1')
b2sums=('dcb1480244513cbe0b4003d869145478c58640a30e843fa25da44cfb0d0331ce27f5dcef63a69163159c4bed4d5a7628ecc8d7d2bef7f3f538439cd74bfcb449')
install=wails.install

prepare() {
  mkdir -vp $pkgname-$pkgver/build
}

build() {
  cd $pkgname-$pkgver/v2
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ ./cmd/wails
}

#check() {
#  cd $pkgname-$pkgver/v2
#  go test ./...
#}

package() {
  install -vDm 755 $pkgname-$pkgver/v2/build/$pkgname -t "$pkgdir/usr/bin/"
  install -vDm 644 $pkgname-$pkgver/{CHANGELOG,CONTRIBUTORS,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
