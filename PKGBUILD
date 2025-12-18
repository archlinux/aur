# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=blip
pkgver=1.2.1
pkgrel=1
pkgdesc='Sublime MySQL monitoring'
url='https://github.com/block/blip'
arch=('aarch64' 'x86_64')
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f717c197504dd8237682827ee8a611d4eadb48367ea4e46580c4a6ca9d733cc0')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-w -s -linkmode=external" -o "$pkgname" "bin/$pkgname/main.go"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
