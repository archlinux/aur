# Maintainer: w0rty <mawo97 at gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=wails
pkgver=2.9.3 # renovate: datasource=github-tags depName=wailsapp/wails
pkgrel=1
pkgdesc="Create desktop apps using Go and Web Technologies"
arch=(x86_64)
url="https://github.com/wailsapp/wails"
license=(MIT)
depends=('glibc' 'npm')
makedepends=(
  'go'
  'webkit2gtk'
  'gtk3'
)
optdepends=('docker')
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('6aa13bb74bc73545b395da9d997aeb94bfdd4583dd0118972c45d90b850bc5007811464c4b34ff5100bc21cce8365b30e69b504ae5c43c44b2f86a4c91bd5f44')
b2sums=('8c9b461fc1bd35d3b960e6339f3fa18b748345077ebd45e756fafc35e00148d0f81661b757ebf3ded2fb4ad7b961ab0f5cb4aa1639f68fe25f906f534f27161d')

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
