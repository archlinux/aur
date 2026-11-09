# Maintainer: Joey Eamigh <55670930+JoeyEamigh@users.noreply.github.com>

pkgname=bridgething-bin
pkgver=0.17.1
pkgrel=1
pkgdesc='Desktop companion app for Spotify Car Things running bridgething'
arch=('x86_64' 'aarch64')
url='https://bridgething.com'
license=('MIT' 'LGPL-2.1-or-later')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libgcc'
  'libsoup3'
  'libstdc++'
  'webkit2gtk-4.1'
)
makedepends=('squashfs-tools')
optdepends=(
  'geoclue: host location for the car thing'
  'networkmanager: online and offline edges'
  'pipewire-pulse: host volume control and local playback'
  'speech-dispatcher: spoken voice replies'
)
provides=('bridgething')
conflicts=('bridgething')
options=('!strip' '!debug')
source=('LICENSE')
source_x86_64=("https://ota.bridgething.com/desktop/stable/${pkgver}/linux-x86_64/bridgething_${pkgver}_amd64.AppImage")
source_aarch64=("https://ota.bridgething.com/desktop/stable/${pkgver}/linux-aarch64/bridgething_${pkgver}_aarch64.AppImage")
sha256sums=('802df6ea3d914b486937606ee9465bf2d9d00a1cf5f6d217cc3806549e428e9c')
sha256sums_x86_64=('a49c88783a0398ab57130baf654e369328e22c4004d83f699fdfa9c9d7ba9d0e')
sha256sums_aarch64=('96605063e61d8d6b790a43ec1a66772814360bb33c61fec629fbd87eca804175')

prepare() {
  local appimage header offset
  appimage=$(echo bridgething_*.AppImage)
  header=$(LC_ALL=C readelf -h "${appimage}")
  offset=$(awk '/Start of section headers/ {s=$5} /Size of section headers/ {z=$5} /Number of section headers/ {n=$5} END {print s + z * n}' <<<"${header}")
  rm -rf appdir
  unsquashfs -q -n -o "${offset}" -d appdir "${appimage}" \
    usr/bin/bridgething-desktop usr/bin/bridgething-ffmpeg usr/share/applications usr/share/icons usr/lib/bridgething
}

package() {
  cp -dr --no-preserve=ownership appdir/usr "${pkgdir}/"
  find "${pkgdir}/usr/share/icons" -type d -empty -delete
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /usr/lib/bridgething/licenses/bridgething-ffmpeg-NOTICE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/bridgething-ffmpeg-NOTICE.txt"
}
