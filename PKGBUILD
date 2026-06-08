# Maintainer: Sapphic Angels <chloe@sapphic.moe>
# Binary package PKGBUILD - installs from pre-built releases
pkgname=chiri-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A cross-platform CalDAV task management app. Currently in very early alpha! (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/chiriapp/chiri"
license=('Zlib')
replaces=('caldav-tasks-bin' 'caldav-tasks')
conflicts=('caldav-tasks-bin' 'caldav-tasks')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)
options=('!strip' '!emptydirs')
install=${pkgname}.install
provides=('chiri')

source_x86_64=(
  "https://github.com/chiriapp/chiri/releases/download/app-v${pkgver}/Chiri_${pkgver}_amd64.deb"
  "chiri.desktop"
)
source_aarch64=(
  "https://github.com/chiriapp/chiri/releases/download/app-v${pkgver}/Chiri_${pkgver}_arm64.deb"
  "chiri.desktop"
)

sha256sums_x86_64=(
  '452d250b6c3ffcb51f36f3c1b8f2e3af4e0f8bdcfb941cf1b8e891191b4740f7'  # Update with actual checksum
  'SKIP'
)
sha256sums_aarch64=(
  '544438eac6fa7ca14176b14a19dbb6ca85316e3900e93bb8a06cc346c9d3b258'  # Update with actual checksum
  'SKIP'
)

package() {
  # Determine which .deb file to extract
  if [ "$CARCH" = "x86_64" ]; then
    local debfile="Chiri_${pkgver}_amd64.deb"
  else
    local debfile="Chiri_${pkgver}_arm64.deb"
  fi

  # Extract the .deb package directly to pkgdir
  bsdtar -xf "$debfile" data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"

  # Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/bin/Chiri"

  # Create AUR installation marker to disable in-app updates
  install -dm755 "${pkgdir}/usr/share/chiri"
  touch "${pkgdir}/usr/share/chiri/.aur-install"
}
