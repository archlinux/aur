#!/bin/bash
# makepkg reads these variables and sets pkgdir itself
# shellcheck disable=SC2034,SC2154
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
# The prebuilt package, from a release's kestrel-nvr archive. The release
# workflow fills in pkgver and the checksums. Only released versions are
# packaged, so the server and every client match.
pkgname=kestrel-nvr-bin
pkgver=0.5.21
pkgrel=1
pkgdesc="Your cameras, recordings and events in one place, with a server for every device (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/kestrel"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'gcc-libs')
optdepends=('webkit2gtk-4.1: the desktop app'
            'gtk3: the desktop app'
            'libayatana-appindicator: the desktop app in the tray'
            'ffmpeg: recording cameras')
provides=('kestrel-nvr')
# The AUR's kestrel, a file encryption tool, has a kestrel command too
conflicts=('kestrel' 'kestrel-nvr')
options=('!strip' '!debug')
install=kestrel-nvr.install
source=('kestrel-nvr.desktop' 'kestrel-nvr.user.service' 'kestrel-nvr.system.service' 'kestrel-nvr.sysusers' 'logo.svg')
source_x86_64=("kestrel-nvr-${pkgver}-linux-x86_64.tar.gz::$url/releases/download/${pkgver}/kestrel-nvr-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("kestrel-nvr-${pkgver}-linux-aarch64.tar.gz::$url/releases/download/${pkgver}/kestrel-nvr-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('7a50102e6e42d2e6d6fbd24a93a0b1e1f0490a42e8229a33ddb41b64e759cfc7')
sha256sums_aarch64=('298e390df87b402b1e2de16730b02e18122dee437943620ebe7dcd4a7e93e5b0')

package() {
  local bundle="kestrel-nvr-${pkgver}-linux-${CARCH}/lib/kestrel-nvr"

  install -d "$pkgdir/opt" "$pkgdir/usr/bin"
  cp -a "$bundle" "$pkgdir/opt/kestrel-nvr"
  ln -s /opt/kestrel-nvr/Resources/app/kestrel "$pkgdir/usr/bin/kestrel"

  install -Dm644 kestrel-nvr.desktop "$pkgdir/usr/share/applications/kestrel-nvr.desktop"
  install -Dm644 logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kestrel-nvr.svg"
  install -Dm644 "$bundle/Resources/app/web/icons/icon-512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/kestrel-nvr.png"
  install -Dm644 kestrel-nvr.user.service "$pkgdir/usr/lib/systemd/user/kestrel-nvr.service"
  install -Dm644 kestrel-nvr.system.service "$pkgdir/usr/lib/systemd/system/kestrel-nvr.service"
  install -Dm644 kestrel-nvr.sysusers "$pkgdir/usr/lib/sysusers.d/kestrel-nvr.conf"
  install -Dm644 "$bundle/Resources/app/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$bundle/Resources/app/go2rtc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/go2rtc.LICENSE"
  install -Dm644 "$bundle/Resources/app/yt-dlp/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/yt-dlp.LICENSE"
  install -Dm644 "$bundle/Resources/app/yt-dlp/THIRD_PARTY_LICENSES" "$pkgdir/usr/share/licenses/$pkgname/yt-dlp.THIRD_PARTY_LICENSES"
  install -Dm644 "$bundle/Resources/app/node/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/node.LICENSE"
}
