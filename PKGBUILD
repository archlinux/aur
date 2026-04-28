# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=puzzletea
pkgver=2.0.1
pkgrel=1
pkgdesc="A collection of puzzle bubbles for BubbleTea"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/FelineStateMachine/puzzletea"
license=('MIT')
depends=('glibc')
makedepends=('go')
checkdepends=('just')
source=("https://github.com/FelineStateMachine/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5bdd4c30f43774caf145b90138682af496bbc52c9d2be27730b4f0a2c25ad5a')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/$pkgname .
}

check() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  just test-short
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
