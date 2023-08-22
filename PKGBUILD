pkgname=goldwarden
pkgver=0.1.5
pkgrel=1
pkgdesc='A feature-packed Bitwarden compatible desktop integration'
arch=('x86_64')
url="https://github.com/quexten/$pkgname"
license=('MIT')
makedepends=('go' 'libfido2' 'gcc' 'wayland' 'libx11' 'libxkbcommon' 'libxkbcommon-x11' 'libxcursor' 'base-devel' 'vulkan-headers')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56019f3985d844e877f04fc159e883ee98ee905f8c621cf4f653134fc14f4def')

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
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  export CGO_ENABLED=1

  go mod tidy
  go build -o build/$pkgname .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname-$pkgver/resources/com.quexten.goldwarden.policy" "$pkgdir/usr/share/polkit-1/actions/com.quexten.goldwarden.policy"
}
