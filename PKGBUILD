# Maintainer: Kacper Adler <kacper at kacperadler dot info>
pkgname=anker-c200
pkgver=0.1.1
pkgrel=1
pkgdesc="Live preview and settings (FOV, mic pickup, mirror, anti-flicker) for the Anker PowerConf C200 webcam"
arch=('x86_64' 'aarch64')
url="https://github.com/upgreydd/anker-c200-linux"
license=('MIT')
depends=('glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'libxxf86vm' 'libxkbcommon' 'wayland')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33a49f414fb6cf1c02a526cff0a3d624211e44ef39ccc84e46aa68ebd1c2d46c')

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
  install -Dm644 packaging/io.github.upgreydd.anker-c200.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 packaging/anker-c200.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/anker-c200.svg"
}
