# Maintainer: Fabrice Aneche <akh@inair.space>

# Upstream is called gmid, but the official repositories already ship the
# Gemini server under that name, hence the gmid-piano package name.
pkgname=gmid-piano
pkgver=0.2.3
pkgrel=1
pkgdesc="Falling-note piano roll, keyboard and chord/scale explorers with MIDI editing"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/gmid"
license=('GPL-3.0-or-later' 'OFL-1.1' 'custom:GeneralUser-GS')
depends=('alsa-lib')
makedepends=('go>=1.27')
optdepends=('musescore: import Guitar Pro and Capella scores')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/gmid/archive/refs/tags/v$pkgver.tar.gz"
  "GeneralUser-GS.sf2::https://raw.githubusercontent.com/mrbumpy409/GeneralUser-GS/684543d5e5efaef08d02be50dcda8d552478fa60/GeneralUser-GS.sf2"
  "GeneralUser-GS-LICENSE.txt::https://raw.githubusercontent.com/mrbumpy409/GeneralUser-GS/684543d5e5efaef08d02be50dcda8d552478fa60/documentation/LICENSE.txt"
)
sha256sums=(
  'ac8951b39c5a35dc1856c22d2fbd8a663cf59633c69ef033f2e28c08822e0802'
  '9575028c7a1f589f5770fccc8cff2734566af40cd26ed836944e9a5152688cfe'
  '7b32efefdf95ce38a043799f0659853ddc00fbaa14d8c50f0aca16b9b8b405be'
)

prepare() {
  cd "gmid-$pkgver"
  # The 31 MB GeneralUser GS bank is not committed upstream; `make assets`
  # downloads it at build time. Ship the pinned copy as the bundled GM bank.
  install -Dm644 "$srcdir/GeneralUser-GS.sf2" assets/soundfonts/GeneralUser-GS.sf2
}

build() {
  cd "gmid-$pkgver"
  # cgo: malgo (miniaudio) for audio, rtmididrv for MIDI input.
  export CGO_ENABLED=1
  go build -trimpath -buildvcs=false \
    -ldflags "-s -w -X main.version=$pkgver" -o gmid ./cmd/gmid
}

check() {
  cd "gmid-$pkgver"
  export CGO_ENABLED=1
  go test ./...
}

package() {
  cd "gmid-$pkgver"

  # assets/ must stay next to the binary: internal/config.AssetsDir probes the
  # executable's directory. The launcher also sets GMID_ASSETS explicitly.
  install -Dm755 gmid "$pkgdir/usr/lib/$pkgname/$pkgname"
  cp -r assets "$pkgdir/usr/lib/$pkgname/assets"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
export GMID_ASSETS=/usr/lib/$pkgname/assets
exec /usr/lib/$pkgname/$pkgname "\$@"
EOF

  # Upstream desktop entry, with Exec pointing at the versioned package name.
  install -Dm644 packaging/linux/gmid.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s/^Exec=gmid\$/Exec=$pkgname/" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Upstream ships the full hicolor set; gmid.png matches the Icon= entry.
  for size in 16 32 48 64 128 256 512 1024; do
    install -Dm644 "assets/icons/gmid-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/gmid.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
  install -Dm644 "$srcdir/GeneralUser-GS-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GeneralUser-GS"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 docs/SHORTCUTS.md docs/MCP.md "$pkgdir/usr/share/doc/$pkgname/"
}
