# Maintainer: lmartinez-mirror
pkgname=frangipanni
pkgver=0.5.0
pkgrel=3
pkgdesc="Program to convert lines of text into a tree structure"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/birchb1024/frangipanni"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.15.2')
# checkdepends=('jp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11a181c582f57c1a3d0f1cc934eacb6a7e18ca458c6575c84efcbb9b4bfcc0e2')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/none/$pkgver/" frangipanni.go
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname-$pkgver"
  go build -o frangipanni frangipanni.go
}

# check() {
#   cd "$pkgname-$pkgver"
#   test/confidence.sh
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 frangipanni -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
