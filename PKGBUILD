# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=infopanel-bin
_pkgname=infopanel
pkgver=0.2.3
pkgrel=1
pkgdesc="Hardware monitoring dashboards for desktop overlays, USB LCD panels and web browsers"
arch=('x86_64')
url="https://github.com/emaspa/InfoPanel-linux"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'fontconfig' 'libx11' 'libice' 'libsm')
optdepends=('ffmpeg: video and RTSP display items'
            'smartmontools: SMART drive health sensors'
            'pipewire-pulse: audio spectrum plugin (or pulseaudio)')
provides=('infopanel')
conflicts=('infopanel')
install=infopanel-bin.install
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/infopanel-$pkgver-linux-x64.tar.gz")
sha256sums=('cb25913651237d718dedc6c30102b223153691dbac04c6d4a8860252df794e80')

package() {
  cd "infopanel-$pkgver-linux-x64"

  # Self-contained .NET app
  install -d "$pkgdir/opt/$_pkgname"
  cp -r --no-preserve=ownership infopanel/. "$pkgdir/opt/$_pkgname/"
  chmod 755 "$pkgdir/opt/$_pkgname/infopanel"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/infopanel" "$pkgdir/usr/bin/infopanel"

  # USB panel access
  install -Dm644 infopanel-udev.rules "$pkgdir/usr/lib/udev/rules.d/99-infopanel.rules"

  # SMART drive health sensors (root timer dumps smartctl JSON for the plugin)
  install -Dm755 infopanel-smart-dump.sh "$pkgdir/usr/lib/$_pkgname/infopanel-smart-dump.sh"
  install -Dm644 infopanel-smart.service "$pkgdir/usr/lib/systemd/system/infopanel-smart.service"
  # The tarball's install.sh puts the dump script in /usr/local/lib; this
  # package ships it in /usr/lib, so point the unit there.
  sed -i "s|/usr/local/lib/$_pkgname/|/usr/lib/$_pkgname/|" \
    "$pkgdir/usr/lib/systemd/system/infopanel-smart.service"
  install -Dm644 infopanel-smart.timer "$pkgdir/usr/lib/systemd/system/infopanel-smart.timer"

  # Desktop integration
  install -Dm644 infopanel.desktop "$pkgdir/usr/share/applications/infopanel.desktop"
  sed -i "s|^Exec=.*|Exec=/opt/$_pkgname/infopanel|" "$pkgdir/usr/share/applications/infopanel.desktop"
  install -Dm644 infopanel.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/infopanel.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/LICENSES.md"
}
