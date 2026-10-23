# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=pdg
pkgver=0.2.1
pkgrel=1
pkgdesc="Zero-install, pure-CPU text-to-speech engine with an embedded model"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/pdg"
# Project code is Apache-2.0; the shipped build embeds the eSpeak NG WASI
# module, which is GPL-3.0-or-later (see LICENSES.md upstream).
license=('Apache-2.0' 'GPL-3.0-or-later')
makedepends=('go>=1.27')
optdepends=(
  'pipewire-audio: pw-play/pw-cat playback'
  'libpulse: paplay playback'
  'alsa-utils: aplay playback'
  'ffmpeg: ffplay playback'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/pdg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c7ae195194055223fd3d51236bec5133a7d780f8a0f924dd69b74b0d6671881')

build() {
  cd "pdg-$pkgver"
  # Go 1.27 SIMD kernels, with the eSpeak NG WASI fallback embedded in the
  # binary; CGO is not used.
  export CGO_ENABLED=0
  export GOEXPERIMENT=simd
  go build -trimpath -buildvcs=false -tags espeakwasm \
    -ldflags "-s -w -X main.version=$pkgver" -o pdg ./cmd/pdg
}

package() {
  cd "pdg-$pkgver"
  install -Dm755 pdg "$pkgdir/usr/bin/pdg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/LICENSES.md"
}
