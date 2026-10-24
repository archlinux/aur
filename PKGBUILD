# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=liner-bin
pkgver=0.2.10
pkgrel=1
pkgdesc="Music player that pulls your music and playlists from other platforms into one app, with synced lyrics (upstream binary)"
arch=('x86_64')
url="https://github.com/tryliner/desktop"
license=('LicenseRef-Liner')
# The libraries the Electron bundle links (readelf -d), plus what it loads at
# run time: libnotify for notifications, libpulse for sound and xdg-utils to
# open links.
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
         'gtk3' 'hicolor-icon-theme' 'libcups' 'libgcc' 'libnotify' 'libpulse'
         'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs'
         'xdg-utils')
optdepends=('traceroute: route check in the network diagnostics')
provides=('liner')
conflicts=('liner')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/liner_${pkgver}_amd64.deb"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tryliner/desktop/v${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('7f32dcc3916ed1e3f3d9ef102d98f2d59da22cb2c4881c484cfafb7293fb0610' '81f3f6b06e8d932ea52b9e0a2ff221aa2400e1fb73ae667431080f03da770940')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" --exclude './usr/share/doc' ./opt ./usr

  install -d "$pkgdir/usr/bin"
  ln -s /opt/Liner/liner "$pkgdir/usr/bin/liner"

  # Without this file the app's updater stays off. With it, the updater
  # installs upstream's .deb through dpkg, behind pacman's back.
  rm "$pkgdir/opt/Liner/resources/package-type"

  # "Audio" alone is not a valid main category
  sed -i 's|^Categories=.*|Categories=AudioVideo;Audio;Player;|' \
    "$pkgdir/usr/share/applications/liner.desktop"

  install -Dm644 "$srcdir/${pkgname}-${pkgver}-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /opt/Liner/LICENSE.electron.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  ln -s /opt/Liner/LICENSES.chromium.html \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
