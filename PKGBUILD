# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
# Previous Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=lollipops
pkgver=1.7.2
pkgrel=1
pkgdesc="Lollipop-style mutation diagrams for annotating genetic variations. https://doi.org/10.1371/journal.pone.0160519"
arch=('x86_64')
url="https://github.com/joiningdata/lollipops"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joiningdata/lollipops/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('287645d960ddeec4366bf7b3519fb470357e1a2742f9b7e099d1ff72ccafdc84b416cc749c725c5f2324db1e8e8f12a828cfce2daf6ebb4a5566edd432c0b297')

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
