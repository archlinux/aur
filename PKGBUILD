# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=rp2350sim
pkgver=0.6.0
pkgrel=1
pkgdesc="RP2350 emulator with a headless runner and a Shirei desktop UI"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/rp2350sim"
license=('Apache-2.0')
makedepends=('go>=1.27')
optdepends=(
  'mesa: GPU rendering for rp2350sim-ui (falls back to the software renderer)'
  'libxkbcommon: keyboard layout support for rp2350sim-ui'
  'alsa-lib: sound playback for the Audio tab'
)
# When bumping pkgver, run `updpkgsums` and
# `makepkg --printsrcinfo > .SRCINFO` before updating the AUR.
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/rp2350sim/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f5427e4cc80e02a5fee469a356571535a152a9590f2117586871d2dc906b92e')

build() {
  cd "$pkgname-$pkgver"
  # Both binaries are CGO-free: the UI uses Shirei/purego, so no C toolchain
  # or GUI headers are needed to build.
  export CGO_ENABLED=0
  # Rebuild the nested UI module explicitly; it keeps a local replace to the
  # root module, so it must be built from the same source tree.
  go build -trimpath -buildvcs=false \
    -ldflags "-s -w -X main.version=$pkgver" -o rp2350sim ./cmd/rp2350sim
  (cd cmd/simui && go build -trimpath -buildvcs=false \
    -ldflags "-s -w -X main.version=$pkgver" -o rp2350sim-ui .)
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 rp2350sim "$pkgdir/usr/bin/$pkgname"
  install -Dm755 cmd/simui/rp2350sim-ui "$pkgdir/usr/bin/rp2350sim-ui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
