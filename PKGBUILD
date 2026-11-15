# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=ovr
pkgver=0.7
pkgrel=1
pkgdesc="Pipe any input through a chain of text transformations, with a CLI and a GUI front end"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/ovr"
license=('MIT')
makedepends=('go>=1.27')
optdepends=(
  'mesa: GPU rendering for ovrui (falls back to the software renderer)'
  'libxkbcommon: keyboard layout support for ovrui'
  'alsa-lib: sound playback for ovrui'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/ovr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('75831c6c4e1d3ae660f482e9526914599ead816e0ef5e45f4ea90a98b3b6a724')

build() {
  cd "$pkgname-$pkgver"
  # Both binaries are CGO-free: shirei's desktop backends and the clipboard
  # library load their system libraries at runtime through purego.
  export CGO_ENABLED=0
  # Add -tags geo to enable the optional geo/h3 transformers (off in upstream
  # release builds).
  go build -trimpath -buildvcs=false -ldflags "-s -w" -o ovr ./cmd/ovr
  go build -trimpath -buildvcs=false -ldflags "-s -w" -o ovrui ./cmd/ovrui
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ovr "$pkgdir/usr/bin/ovr"
  install -Dm755 ovrui "$pkgdir/usr/bin/ovrui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
