# Maintainer: Niyoko Yuliawan <niyoko.yuliawan at logisly dot com>
pkgname=openbot-bin
pkgver=0.48.1
pkgrel=1
pkgdesc='Local-first desktop workspace for persistent AI teammates'
arch=('x86_64' 'aarch64')
url='https://openbot.run/'
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
  'glibc' 'gtk3' 'libcups' 'libsecret' 'libx11' 'libxcb' 'libxcomposite'
  'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr'
  'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'xdg-utils'
)
makedepends=('7zip' 'desktop-file-utils')
optdepends=(
  'bubblewrap: sandbox for Codex agents'
  'gnome-keyring: Secret Service storage when no other provider is running'
  'libappindicator: system tray integration'
  'libnotify: desktop notifications'
  'nodejs: Local scripts API command-line client'
  'icu74: upstream x86_64 remote-desktop runtime'
  'libevdev: upstream x86_64 remote-desktop runtime'
  'libpulse: upstream x86_64 remote-desktop runtime'
  'libva: upstream x86_64 remote-desktop runtime'
  'numactl: upstream x86_64 remote-desktop runtime'
)
provides=('openbot')
conflicts=('openbot')
options=('!strip' '!debug')
_release="https://github.com/nightly-labs/openbot/releases/download/v${pkgver}"
source=(
  "LICENSE.openbot::https://raw.githubusercontent.com/nightly-labs/openbot/v${pkgver}/LICENSE"
  "NOTICE.openbot::https://raw.githubusercontent.com/nightly-labs/openbot/v${pkgver}/NOTICE"
)
source_x86_64=("${_release}/OpenBot-${pkgver}-x86_64.AppImage")
source_aarch64=("${_release}/OpenBot-${pkgver}-arm64.AppImage")
noextract=("OpenBot-${pkgver}-x86_64.AppImage" "OpenBot-${pkgver}-arm64.AppImage")
sha256sums=(
  'ffe034ecf735f296ca53cbd856c944849f0c80c7e1490ce162038a99ad89c728'
  '3995ad096839d696f4ff70227ac56c89b3c25e6b549bb87cf9d98dce901b75f7'
)
sha256sums_x86_64=('66bf6c93690612eb019416172b978beeb58e8c5485d4e8cec713ff1e86d3e4fc')
sha256sums_aarch64=('06acb1b2d9dbc66fd7ce68007edf18358eaf572716eec9d43d2538ff898b52a7')

prepare() {
  local image_arch=$CARCH
  [[ $CARCH == aarch64 ]] && image_arch=arm64
  7z x -y -oapp "OpenBot-${pkgver}-${image_arch}.AppImage" >/dev/null
  # Start the executable directly to retain Chromium's sandbox.
  sed -i 's|^Exec=.*|Exec=openbot %U|' app/openbot.desktop
}

check() {
  desktop-file-validate app/openbot.desktop
  test -x app/openbot
  test -s app/resources/app.asar
  ! grep -q -- '--no-sandbox' app/openbot.desktop
}

package() {
  install -d "$pkgdir/opt/openbot" "$pkgdir/usr/bin"
  # shortcut: remote desktop needs upstream Ubuntu ABIs, revisit when upstream ships portable binaries.
  cp -dr --preserve=mode,timestamps app/. "$pkgdir/opt/openbot/"
  install -Dm644 app/openbot.desktop "$pkgdir/usr/share/applications/openbot.desktop"
  install -Dm644 app/openbot.png "$pkgdir/usr/share/icons/hicolor/1600x1600/apps/openbot.png"
  install -Dm644 LICENSE.openbot "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE.openbot "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  # Arch supplies desktop integration and libraries; skip AppImage-only files.
  rm -r "$pkgdir/opt/openbot/usr"
  rm "$pkgdir/opt/openbot/AppRun" "$pkgdir/opt/openbot/.DirIcon" \
    "$pkgdir/opt/openbot/openbot.desktop" "$pkgdir/opt/openbot/openbot.png"
  find "$pkgdir/opt/openbot" -type d -exec chmod 755 {} +
  chmod 4755 "$pkgdir/opt/openbot/chrome-sandbox"
  ln -s /opt/openbot/openbot "$pkgdir/usr/bin/openbot"
}
