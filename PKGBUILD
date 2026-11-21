# Maintainer: Kacper Adler <kacper at kacperadler dot info>
pkgname=anker-c200
pkgver=0.1.0
pkgrel=1
pkgdesc="Live preview and settings (FOV, mic pickup, mirror, anti-flicker) for the Anker PowerConf C200 webcam"
arch=('x86_64' 'aarch64')
url="https://github.com/upgreydd/anker-c200-linux"
license=('MIT')
depends=('glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'libxxf86vm' 'libxkbcommon' 'wayland')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('191d03156ec0df9f1beb83a84816861557e22fede5633a5253e2ff2cff9a279f')

build() {
  cd "anker-c200-linux-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.version=v$pkgver" -o anker-c200 .
}

check() {
  cd "anker-c200-linux-$pkgver"
  go test ./...
}

package() {
  cd "anker-c200-linux-$pkgver"
  install -Dm755 anker-c200 "$pkgdir/usr/bin/anker-c200"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
