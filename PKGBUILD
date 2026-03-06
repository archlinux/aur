# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
pkgname=puzzletea
pkgver=1.7.0
pkgrel=1
pkgdesc="A collection of puzzle bubbles for BubbleTea"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/FelineStateMachine/puzzletea"
license=('MIT')
depends=('glibc')
makedepends=('go')
checkdepends=('just')
source=("https://github.com/FelineStateMachine/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf8f2083ff114865922953031b20767b5d5208750fa1df45ea6e785dbbe9b6e8')

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
  just test-short
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
