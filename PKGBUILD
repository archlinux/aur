# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: Core_UK <dev@coredev.uk>

pkgname=cider
pkgver=1.6.3.20250909032549
pkgrel=3
pkgdesc='An abandoned Apple Music player using a fork of Cider v1 from taoky/Cider'
arch=('x86_64')
url='https://github.com/taoky/Cider'
license=('AGPL-3')
depends=(
  'alsa-lib'
  'gtk3'
  'libxcrypt-compat'
  'nss'
)
makedepends=('git' 'nodejs' 'pnpm')
optdepends=('libnotify: Playback notifications')
options=(!buildflags !debug !makeflags !strip)
source=("git+$url.git#tag=${pkgver##*.}")
b2sums=('d41fb1fb07e86153baa74f213ff89ea3c327b5a6e9f276f11a3f729d76e4e8e420dec6f3a7777565eb45935dd49bea63f84d85dfc717acf7a79df559f54b0b17')
install=cider.install

prepare() {
  cd Cider

  # Use TOKEN environment variable
  echo 'localStorage.setItem("lastToken", process.env.TOKEN);' >> ./src/preload/cider-preload.js
  sed -i "/var prompt = \`Cider is not responding/c\\var prompt = \`Your Apple Music TOKEN is expired or invalid. Edit /usr/share/applications/sh.cider.Cider.desktop and modify the TOKEN value in the Exec line then restart Cider. (Current value of TOKEN=\${lastToken}).\`;" ./src/renderer/main/events.js

  # Temporary fix for missing thumbnail
  # See https://github.com/taoky/Cider/pull/13
  sed -i 's|forceDirectives: {},|forceDirectives: { lcdArtworkSize: { value: 256 } },|' ./src/renderer/main/vueapp.js

  pnpm install
}

build() {
  cd Cider
  pnpm run build
  pnpm exec electron-builder --linux deb --publish=never

  # Extract the deb file
  bsdtar -xf ./dist/cider*_amd64.deb --include='data.tar*' -O | bsdtar -xf - -C "$srcdir"

  # Add TOKEN environment variable to .desktop file
  sed -i 's|Exec=/opt/Cider/sh.cider.Cider|Exec=env TOKEN=none CIDER_PORT=9000 /usr/bin/cider|' "$srcdir/usr/share/applications/sh.cider.Cider.desktop"

  # Modify apparmor-profile to include cider link
  sed -i 's|"/opt/Cider/sh.cider.Cider"|("/opt/Cider/sh.cider.Cider" "/usr/bin/cider")|' "$srcdir/opt/Cider/resources/apparmor-profile"
}

package() {
  # 1. CREATE BINARY LINK
  install -d "$pkgdir/usr/bin/"
  ln -sf /opt/Cider/sh.cider.Cider "$pkgdir/usr/bin/cider"

  # 2. COPY DEB FILES
  cp -dr --no-preserve=ownership ./{opt,usr} "$pkgdir"

  # 3. COPY APPARMOR PROFILE
  install -Dm644 ./opt/Cider/resources/apparmor-profile "$pkgdir/etc/apparmor.d/cider"
}
