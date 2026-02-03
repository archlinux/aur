# Maintainer: Corey Bruce <cdfrosty at gmail dot com>

pkgbase=sonic3air-bin

# Only define the ARM subpackage on aarch64
if [[ "$CARCH" == "aarch64" ]]; then
  pkgname=(sonic3air-bin sonic3air-bin-aarch64)
else
  pkgname=(sonic3air-bin)
fi

pkgver=v24.02.02.1
scriptver=1.3
pkgrel=6

pkgdesc='A fan-made widescreen remaster of Sonic 3 & Knuckles.'
url='https://sonic3air.org/'
license=('GPL-3.0')
arch=('x86_64' 'aarch64')

depends=('opengl-driver' 'sdl2' 'zenity' 'yad')
optdepends=('discord: Discord rich presence support')
provides=('sonic3air')

source=(
  "sonic3air_$pkgver.tar.gz::https://github.com/Eukaryot/sonic3air/releases/download/v24.02.02.0-stable/sonic3air_game.tar.gz"
  "https://gitlab.com/linuxbombay/sonic3air/sonic3air/-/archive/$scriptver/sonic3air-$scriptver.tar.bz2"
  "LICENSE.md"
)

# ARM64-only x86_64 runtime libs for box64
source_aarch64=(
  "Sonic3Airx64-libs-$pkgver.tar.xz::https://gitlab.com/linuxbombay/armlibpatches/sonic3air/$pkgver/-/raw/main/Sonic3Airx64-libs-$pkgver.tar.xz"
)

sha256sums=('502c4ca9d5cb52db4a25b860b1003949d9ae0697f37f6368098346e67654bb16'
            'fbdbf3bc17b123a9c95fdc399727e2ea0babbadff531423d138cc27099aa4c6c'
            '4bff643c05c2396b7e2987721c2f77cd3921434a0a2511f4a3bf31fc53fd7d76')
sha256sums_aarch64=('77f45b48edd75ee6193542a44781dc0a9d376597f4cb55cee69fe4ae458f8da7')


prepare() {
  chmod -R 775 "$srcdir/sonic3air_game"
}

_package_common() {
  install -dm755 "$pkgdir/usr/share/games/Sonic3Air"

  install -Dm755 "$srcdir/sonic3air-$scriptver/sonic3air" \
    "$pkgdir/usr/bin/sonic3air"

  install -Dm644 "$srcdir/sonic3air-$scriptver/sonic3air.desktop" \
    "$pkgdir/usr/share/applications/sonic3air.desktop"

  install -Dm755 "$srcdir/sonic3air-$scriptver/sonic3air.png" \
    "$pkgdir/usr/share/pixmaps/sonic3air.png"

  install -Dm644 LICENSE.md \
    "$pkgdir/usr/share/licenses/sonic3air/LICENSE.md"

  mkdir -p \
    "$pkgdir/usr/share/games/Sonic3Air/data" \
    "$pkgdir/usr/share/games/Sonic3Air/bonus" \
    "$pkgdir/usr/share/games/Sonic3Air/doc"

  cp -r "$srcdir/sonic3air_game/data/"* \
    "$pkgdir/usr/share/games/Sonic3Air/data"
  cp -r "$srcdir/sonic3air_game/bonus/"* \
    "$pkgdir/usr/share/games/Sonic3Air/bonus"
  cp -r "$srcdir/sonic3air_game/doc/"* \
    "$pkgdir/usr/share/games/Sonic3Air/doc"

  cp "$srcdir/sonic3air_game/config.json" \
     "$srcdir/sonic3air_game/Manual.pdf" \
     "$pkgdir/usr/share/games/Sonic3Air"

  cp -r "$srcdir/sonic3air_game/sonic3air_linux" \
    "$pkgdir/usr/share/games/Sonic3Air/sonic3air"

  find "$srcdir/sonic3air_game" -type f -name "*.so" \
    -exec cp {} "$pkgdir/usr/share/games/Sonic3Air" \;
}

package_sonic3air-bin() {
  pkgdesc="$pkgdesc (base game)"
  _package_common
}

package_sonic3air-bin-aarch64() {
  pkgdesc="$pkgdesc (ARM64 Box64 runtime add-on)"
  depends=('sonic3air-bin' 'box64')

  libdst="$pkgdir/usr/lib/x86_64-linux-gnu/Sonic3Air"
  install -dm755 "$libdst"

  # Copy Box64 runtime libraries (flat layout in srcdir)
  find "$srcdir" -maxdepth 1 -type f \( -name "*.so" -o -name "*.so.*" \) \
    -exec cp -av {} "$libdst/" \;
}
