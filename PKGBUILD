# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=pdgfr
pkgver=0.1
pkgrel=1
pkgdesc="Zero-install, pure-CPU French text-to-speech engine with an embedded model"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/pdgfr"
# Project code is Apache-2.0; the shipped build embeds the Brindille model
# (CC BY 4.0) and Unicode tables (Unicode License v3). See LICENSES.md and
# NOTICE upstream.
license=('Apache-2.0' 'CC-BY-4.0' 'Unicode-3.0')
makedepends=('go>=1.27')
optdepends=(
  'pipewire-audio: pw-play/pw-cat playback'
  'libpulse: paplay playback'
  'alsa-utils: aplay playback'
  'ffmpeg: ffplay playback'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/pdgfr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('839e9910e39f0876d0d085441d8d1ae10058e4dbb8434d0c7a59b6cd7495bb07')

build() {
  cd "pdgfr-$pkgver"
  # Pure Go, CGO-free: the Alkove runtime is WebAssembly executed in-process
  # by wazero, and the model is embedded in the binary.
  export CGO_ENABLED=0
  go build -trimpath -buildvcs=false \
    -ldflags "-s -w -X main.version=$pkgver" -o pdgfr ./cmd/pdgfr
}

package() {
  cd "pdgfr-$pkgver"
  install -Dm755 pdgfr "$pkgdir/usr/bin/pdgfr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/LICENSES.md"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
