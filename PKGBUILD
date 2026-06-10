# Maintainer: Hornfisk <hornfisk@users.noreply.github.com>
pkgname=niner-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Three-layer synthesized kick drum plugin (VST3, CLAP, Standalone) — prebuilt binary"
arch=('x86_64')
url="https://github.com/hyperfocusdsp/niner"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libxcb' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'freetype2' 'fontconfig' 'alsa-lib' 'gtk3' 'bash' 'hicolor-icon-theme')
optdepends=('pipewire-jack: low-latency standalone audio backend')
provides=('niner' 'niner-vst3' 'niner-clap' 'niner-standalone' 'slammer')
replaces=('slammer')
conflicts=('niner' 'slammer')
source=(
  "niner-$pkgver-bin.tar.gz::https://github.com/hyperfocusdsp/niner/releases/download/v$pkgver/niner-linux-x86_64.tar.gz"
  "niner-$pkgver.tar.gz::https://github.com/hyperfocusdsp/niner/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '75f15ba37ad99bf35322c63b831a208f07c1946290e86e9f0c2b424d4c48b0fb'
  '1356750744ad8716a224d28442573efde8b4a1dfeca349320d82fd48d818a1d4'
)

package() {
  # binaries from prebuilt release tarball
  cd "$srcdir/niner-linux-x86_64"

  # VST3 bundle (preserve dir structure)
  install -dm755 "$pkgdir/usr/lib/vst3"
  cp -r niner.vst3 "$pkgdir/usr/lib/vst3/"

  # CLAP plugin
  install -Dm644 niner.clap "$pkgdir/usr/lib/clap/niner.clap"

  # Standalone binary
  install -Dm755 niner-standalone "$pkgdir/usr/bin/niner-standalone"

  # Desktop launcher shim
  install -Dm755 tools/niner-launch.sh "$pkgdir/usr/bin/niner-launch"

  # .desktop entry
  install -dm755 "$pkgdir/usr/share/applications"
  sed 's|__BIN_DIR__|/usr/bin|g' tools/niner.desktop.template \
    > "$pkgdir/usr/share/applications/niner.desktop"
  chmod 644 "$pkgdir/usr/share/applications/niner.desktop"

  # assets from source archive (icons + license not in binary tarball)
  cd "$srcdir/niner-$pkgver"

  for sz in 16 32 48 128 256 512 1024; do
    src="assets/icon/niner-${sz}.png"
    [ -f "$src" ] || continue
    install -Dm644 "$src" "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/niner.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
