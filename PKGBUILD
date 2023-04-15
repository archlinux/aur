# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
# Previous Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=lollipops
pkgver=1.6.0
pkgrel=2
pkgdesc="Lollipop-style mutation diagrams for annotating genetic variations. https://doi.org/10.1371/journal.pone.0160519"
arch=('x86_64')
url="https://github.com/joiningdata/lollipops"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joiningdata/lollipops/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('98752dec7eb06e03f71d51eef0b6964fdd63ba8b01fdc22ec2c3f35ab6e33eb5891a3f5ce8588e0af6474fac15035be2fb57bc35c398ce8eea9a2ca52b874e7c')

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

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
