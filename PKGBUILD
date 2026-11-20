# Maintainer: Bipin Kumar  <kbipinkumar@pm.me>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcfanno
pkgver=0.3.10
pkgrel=1
pkgdesc="Annotate a VCF with other VCFs/BEDs/tabixed files http://dx.doi.org/10.5281/zenodo.49500"
arch=('x86_64')
url='https://github.com/brentp/vcfanno'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/brentp/vcfanno/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('6a13fc9fe247f2726b6294e55e713281e62e4a5c279501e60763c52c4c921d45')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build 
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
