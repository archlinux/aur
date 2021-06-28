# Maintainer: Artem Trokhycmhuk <yuc44w68t at relay dot firefox dot com>
pkgname=nocolor
pkgver=1.0.1
pkgrel=1
pkgdesc="Validate the architecture of your PHP project based on the concept of function colors"
arch=(x86_64)
url="https://github.com/VKCOM/nocolor"
license=('MIT')
makedepends=('go')
provides=(nocolor)
conflicts=(nocolor-bin nocolor-git)
source=("https://github.com/VKCOM/nocolor/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('caf99846b1472dcc7e2e78e2c56dc15b2ed23b26d6fa0b5113696e60772ed284')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir -p build/
}

build() {
    ls
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build 

}

check(){
    cd "$pkgname-$pkgver"
    go test -tags tracing -count 3 -race -v ./tests/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname

}
