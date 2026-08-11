# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=blip
pkgver=2.1.0
pkgrel=1
pkgdesc='Sublime MySQL monitoring'
url='https://github.com/block/blip'
arch=('aarch64' 'x86_64')
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cd5c932f86d3a50419e42fcfc24b0aa3418e73d5a46c77c01eb10bc655c751a8')

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
