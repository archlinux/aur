# Maintainer: Celti B. <celti@celti.name>

pkgname=restray
pkgver=0.23.1
pkgrel=1
pkgdesc='powerful but friendly backup program that runs in your tray, powered by restic'
arch=('x86_64')
url='https://devins.page/restray'
license=('GPL-3.0-only')
depends=('glibc' 'hicolor-icon-theme' 'restic')
makedepends=('go' 'imagemagick')
source=("$pkgname-v$pkgver.tar.gz::https://tangled.org/devins.page/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b5fdbef863461838e92492418f7f7cab8ff58bc2c0795d8f2d5b95750c24c7bc9709b9afb377cd8581adb2bad10ce8017102d0efb2f6ba00ab6cd760892482d2')

prepare() {
  cd "${pkgname}-v${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-v$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/ ./cmd/...
}

check() {
  cd "$pkgname-v$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 packaging/linux/$pkgname-user.service "$pkgdir"/usr/lib/systemd/user/$pkgname.service
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ packaging/linux/$pkgname.service
  install -Dm644 -t "$pkgdir"/usr/share/applications/ packaging/linux/$pkgname.desktop
  install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/1024x1024/apps/ packaging/linux/$pkgname.png

  for size in 16 24 32 48 64 128 256 512; do
    install -dm755 "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
    magick packaging/linux/$pkgname.png -resize ${size}x${size} \
      "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png
  done
}
