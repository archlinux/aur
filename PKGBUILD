# Maintainer: Bipin Kumar  <bipin@ccmb.res.in>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcfanno
pkgver=0.3.5
pkgrel=2
pkgdesc="Annotate a VCF with other VCFs/BEDs/tabixed files http://dx.doi.org/10.5281/zenodo.49500"
arch=('x86_64')
url='https://github.com/brentp/vcfanno'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/brentp/vcfanno/archive/refs/tags/v0.3.5.tar.gz)
sha256sums=('4f32add17525fc306eb80d213adbfac751a976f9b92ede9ee4c25428837743da')

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
