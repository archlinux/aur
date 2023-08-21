# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname='ollama'
pkgdesc='Create, run, and share large language models (LLMs).'
pkgver='0.0.15'
pkgrel='1'
arch=('x86_64')
url='https://github.com/jmorganca/ollama'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jmorganca/ollama/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c97a0e8d26cca73e5a75f22f90c300733bfeddc3f11ae3280e76d0c10ef14ccc')

prepare() {
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

check() {
  cd "$pkgname-$pkgver"
  go test .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
