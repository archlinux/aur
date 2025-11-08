# Maintainer: w0rty <mawo97 at gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=wails
pkgver=2.11.0 # renovate: datasource=github-tags depName=wailsapp/wails
pkgrel=1
pkgdesc="Create desktop apps using Go and Web Technologies"
arch=(x86_64)
url="https://github.com/wailsapp/wails"
license=(MIT)
depends=('glibc' 'npm' 'webkit2gtk' 'gtk3')
makedepends=('go')
optdepends=('docker')
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('6ed5f3b67e994ccafd43883ee090d77266c4d1e51576189c38016d6cba35872a2e67eaeae71e4d6ad2e779b2c634b4b67743cfc55445437244d6eab235029010')
b2sums=('d8a6d3ae79efd753485577c20c0b49f0a19df960eb7aa58f82363d5f04f9fd3c6d8d94e416366f85b9710c58dadf08751789940dc94ae569b9c4b1866b880fdf')

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
