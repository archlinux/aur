# Maintainer: Mario Oenning <mo-son at mailbox dot org>

pkgname=pacseek
pkgver=0.1.0
pkgrel=1
pkgdesc='A terminal user interface for searching and installing Arch Linux packages'
arch=('x86_64')
url="https://github.com/moson-mo/$pkgname"
license=('GPL2')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('636af34efa810fb9a574e9508472c1bffaae1d93a69e523c5d46db835cf273c0')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build .
}

package() {
  cd "$pkgname-$pkgver"

  # bin
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
