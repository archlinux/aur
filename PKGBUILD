# Maintainer: Feng Yifan <fengyifan@blocgo.com>
# Upstream: https://github.com/Px-asen/Twilight_Echo
# Binary repackage (-bin) of the official Linux .deb release.
# This package is a faithful repackage; upstream-specific fixes (e.g. the
# Linux launcher icon sizes / desktop Categories) are handled upstream, not here.
# NOTE: scripts/check-upstream.sh updates only these anchors when a new
# upstream version is detected: pkgver=, pkgrel=, and sha256sums_x86_64=(...).

pkgname=twilight-echo-bin
pkgver=2.0.2
pkgrel=1
pkgdesc='Modern desktop music player for local collections, streaming exploration and HiFi playback (binary release)'
arch=('x86_64')
url='https://github.com/Px-asen/Twilight_Echo'
license=('Apache-2.0')
depends=(
  gtk3
  nss
  libxss
  libxtst
  libnotify
  libsecret
  at-spi2-core
  util-linux-libs
  alsa-lib
  libpulse
  libxcomposite
  libxdamage
  libxrandr
  libxfixes
  libxkbcommon
  libcups
  nspr
  xdg-utils
  mesa
)
optdepends=('libappindicator-gtk3: system tray / indicator support')
provides=('twilight-echo')
conflicts=('twilight-echo')
options=('!strip' '!debug' '!emptydirs')
install="${pkgname}.install"

_asset="TwilightEcho_${pkgver}_amd64.deb"
source_x86_64=("${_asset}::https://github.com/Px-asen/Twilight_Echo/releases/download/v${pkgver}/${_asset}" "LICENSE::https://raw.githubusercontent.com/Px-asen/Twilight_Echo/v${pkgver}/LICENSE")
sha256sums_x86_64=('bf1696299e163422ef25199a1d2a43e3a6cf420f89b69599b79ba08c78edc89b' '6727ef7a9b1844ba225c76436938c66a049ae5ddb4cb2936455f471be657493b')
noextract=("${_asset}")

package() {
  mkdir -p "$srcdir/deb"
  bsdtar -xf "$srcdir/${_asset}" -C "$srcdir/deb"
  bsdtar -xf "$srcdir/deb/data.tar.xz" -C "$pkgdir"

  # Electron's SUID sandbox helper must be setuid root, otherwise the app
  # refuses to start with a "SUID sandbox helper" error.
  chmod 4755 "$pkgdir/opt/TwilightEcho/chrome-sandbox"

  # Provide a CLI command name that matches the package name.
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/TwilightEcho/music "$pkgdir/usr/bin/twilight-echo"

  # Apache-2.0 license text.
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
