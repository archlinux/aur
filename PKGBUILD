# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=retoswap-bin
pkgver=1.13.0
pkgrel=1
_tag="v1.13.0-reto"
pkgdesc="Decentralised P2P exchange built on Monero and Tor, unofficial Reto network (upstream binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/retoaccess1/haveno-reto"
license=('AGPL-3.0-or-later')
# jpackage bundles Java, JavaFX, Tor and the Monero binaries. These are the
# system libraries they link against, plus what upstream's .deb declares.
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'fontconfig' 'freetype2'
         'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libgcc'
         'libglvnd' 'libnotify' 'libx11' 'libxext' 'libxi' 'libxrender'
         'libxtst' 'libxxf86vm' 'pango' 'xdg-utils' 'zlib')
provides=("retoswap=${pkgver}")
conflicts=('retoswap')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/${_tag}/haveno-v${pkgver}-linux-x86_64-installer.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/${_tag}/haveno-v${pkgver}-linux-aarch64-installer.deb")
noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${pkgver}-aarch64.deb")
sha256sums_x86_64=('b28b7861bdd5c3cd24ed9b7613dea959e18a333161a471182993f7e75815be99')
sha256sums_aarch64=('9c8792619e75f734a20e53d5b949254e9c232243c1f976bb1fb98a48cd0a1f64')

package() {
  install -d "$pkgdir/opt"
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}-${CARCH}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" ./opt
  # Upstream Haveno uses /opt/haveno as well. The launcher finds its files
  # relative to itself, so the directory can be renamed.
  mv "$pkgdir/opt/haveno" "$pkgdir/opt/retoswap"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/retoswap/bin/Haveno "$pkgdir/usr/bin/retoswap"

  # The .deb registers this through postinst, which pacman never executes.
  install -Dm644 "$pkgdir/opt/retoswap/lib/haveno-Haveno.desktop" \
    "$pkgdir/usr/share/applications/retoswap.desktop"
  sed -i \
    -e 's|^Name=.*|Name=RetoSwap|' \
    -e 's|^Exec=.*|Exec=retoswap|' \
    -e 's|^Icon=.*|Icon=retoswap|' \
    -e '/^MimeType=$/d' \
    "$pkgdir/usr/share/applications/retoswap.desktop"
  install -Dm644 "$pkgdir/opt/retoswap/lib/Haveno.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/retoswap.png"
}
