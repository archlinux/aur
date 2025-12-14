# Maintainer: Maxim Kim <exynil@gmail.com>
pkgname=clipbox
pkgver=0.1.3
pkgrel=1
pkgdesc="A powerful clipboard manager for Wayland with rofi integration"
arch=('x86_64' 'aarch64')
url="https://github.com/exynil/clipbox"
license=('GPL3')
depends=('wl-clipboard')
makedepends=('go' 'git')
optdepends=('rofi: for interactive UI')
source=("git+https://github.com/exynil/clipbox.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  mkdir -p build
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=1
  export GOOS=linux
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build/clipbox \
    .
}

package() {
  cd "$pkgname"
  install -Dm755 build/clipbox "$pkgdir/usr/bin/clipbox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

