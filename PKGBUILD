# Maintainer: ml <>
pkgname=ksd
pkgver=1.0.8
pkgrel=1
pkgdesc='kubernetes secret decoder'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/mfuentesg/ksd'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('f9111e7a29eab2931d782e3a7fe34477d62fd856')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -o "$pkgname" -ldflags="-linkmode=external -X=main.version=v$pkgver" main.go
}

check() {
  cd "$pkgname-$pkgver"
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname"
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
