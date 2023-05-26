# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=wails
pkgver=2.4.1
pkgrel=1
pkgdesc="Create desktop apps using Go and Web Technologies"
arch=(x86_64)
url="https://github.com/wailsapp/wails"
license=(MIT)
depends=(glibc)
makedepends=(
  go
  webkit2gtk
  gtk3
)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('fa4a593b5cdad24b5e0e3b8798a6196d6337e8649d20b40b28680ec58a2ceb580e43ad8fa464b2359c57a4c28bc24260bb0b03fa2c073ac2f5236f865311016f')
b2sums=('a39a844d5ad97a2d31b30d46262f8261a3f0c03d9d149d8af10040fcf3918a4244ca6105d360ce24e30c172dd3e3483330a8b5ccee236b8888446bec1dfd59e1')

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

check() {
  cd $pkgname-$pkgver
  go test
}

package() {
  install -vDm 755 $pkgname-$pkgver/v2/build/$pkgname -t "$pkgdir/usr/bin/"
  install -vDm 644 $pkgname-$pkgver/{CHANGELOG,CONTRIBUTORS,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
