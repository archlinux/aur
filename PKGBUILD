# Maintainer: Amog-us <ask at amogussugomus at proton dot me>

pkgname=corsa
pkgver=2.6.72
pkgrel=1
pkgdesc='Decentralized end-to-end encrypted messenger built on the Gazeta protocol'
arch=('x86_64')
url='https://github.com/piratecash/corsa'
license=('MIT')
depends=(
  'libglvnd'
  'mesa'
  'wayland'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxfixes'
  'libxkbcommon'
  'libxkbcommon-x11'
)
makedepends=('go>=1.27.4')
optdepends=('alsa-lib: notification sounds')
source=("$pkgname-$pkgver.tar.gz::https://github.com/piratecash/corsa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('609b28c3e83279620ebff56e9e65c6225895da02f6428eb4c779a5128d6b732f')

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode=external -compressdwarf=false -X gioui.org/app.ID=chat.corsa" \
    -o corsa-desktop ./cmd/corsa-desktop
  go build \
    -ldflags "-linkmode=external -compressdwarf=false" \
    -o corsa-node ./cmd/corsa-node
  go build \
    -ldflags "-linkmode=external -compressdwarf=false" \
    -o corsa-cli ./cmd/corsa-cli
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 corsa-desktop "$pkgdir/usr/bin/corsa-desktop"
  install -Dm755 corsa-node "$pkgdir/usr/bin/corsa-node"
  install -Dm755 corsa-cli "$pkgdir/usr/bin/corsa-cli"

  install -Dm644 packaging/linux/corsa.desktop \
    "$pkgdir/usr/share/applications/corsa.desktop"

  local size
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/png/app-icon-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/corsa.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 docs/{architecture,protocol,encryption,privacy,sdk,roadmap}.md \
    "$pkgdir/usr/share/doc/$pkgname/"
}
