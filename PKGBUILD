pkgname=goldwarden
pkgver=0.1.8
pkgrel=1
pkgdesc='A feature-packed Bitwarden compatible desktop integration'
arch=('x86_64')
url="https://github.com/quexten/$pkgname"
license=('MIT')
makedepends=('go' 'libfido2' 'gcc' 'wayland' 'libx11' 'libxkbcommon' 'libxkbcommon-x11' 'libxcursor' 'base-devel' 'vulkan-headers' 'egl-wayland')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c86952a7d304edeeda90099aab5b8275121ac4b1d1155a094c1460e45be97bb')

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
  chown root:root "$pkgdir/usr/share/polkit-1/actions/com.quexten.goldwarden.policy"
}
