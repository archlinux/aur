# Maintainer: 4bs3nt <hi at 4bs3nt dot com>
# Contributor: Wout Stiens <hello at mrstreamer dot app>
# SPDX-License-Identifier: 0BSD
# Pinned upstream nightly release
pkgname=mrstreamer-nightly-bin
pkgver=0.0.22_nightly.20261028.442
pkgrel=1
pkgdesc='Nightly build of: IPTV player for Xtream Codes and M3U subscriptions, with live TV, programme guide, movies and series'
arch=('x86_64')
url='https://mrstreamer.app'
license=('GPL-3.0-only' 'GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MIT' 'BSD-2-Clause'
         'LicenseRef-Chromium')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme'
         'libcups' 'libgcc' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
         'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango'
         'systemd-libs' 'xdg-utils')
checkdepends=('desktop-file-utils')
optdepends=('libnotify: desktop notifications'
            'libpulse: PulseAudio or PipeWire audio'
            'org.freedesktop.secrets: credential storage in the desktop keyring')
provides=("mrstreamer=$pkgver")
conflicts=('mrstreamer' 'mr-streamer' 'mr-streamer-bin')
# These are upstream nightly binaries. Preserve their bytes and bundled debug information.
options=('!strip' '!debug')
_upstream_version='0.0.22-nightly.20261028.442'
_source_commit='e0eba0b6c19de9252bb8bd69a504ade0731313ae'
_deb="Mr-Streamer-${_upstream_version}-linux-amd64.deb"
source=("https://github.com/Mr-Streamer-OSS/MrStreamer/releases/download/v${_upstream_version}/${_deb}"
        "mrstreamer-LICENSE::https://raw.githubusercontent.com/Mr-Streamer-OSS/MrStreamer/${_source_commit}/LICENSE")
sha256sums=('2a6e5dfc7934e72d55350f889443a2c98acfc9c9daf1b1d7f69e53449999d452'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
  # makepkg opens the deb as an archive. Its maintainer scripts are never executed.
  mkdir -p payload
  bsdtar -xf data.tar.xz -C payload
}

check() {
  test -f 'payload/opt/Mr. Streamer/resources/app.asar'
  local tool
  for tool in mrstreamer chrome-sandbox resources/ffmpeg/ffmpeg resources/ffmpeg/ffprobe; do
    test -x "payload/opt/Mr. Streamer/$tool" || return 1
  done
  desktop-file-validate payload/usr/share/applications/mrstreamer.desktop
}

package() {
  # Metadata must match even when makepkg --nocheck skips check().
  bsdtar -xOf control.tar.xz ./control | grep -Fx "Version: ${_upstream_version//-/\~}"
  bsdtar -xOf control.tar.xz ./control | grep -Fx 'Architecture: amd64'

  local app="$pkgdir/opt/mrstreamer"
  install -dm755 "$pkgdir/opt" "$pkgdir/usr/bin"
  cp -a 'payload/opt/Mr. Streamer' "$app"
  cp -a payload/usr/share "$pkgdir/usr/"
  ln -s /opt/mrstreamer/mrstreamer "$pkgdir/usr/bin/mrstreamer"

  local desktop="$pkgdir/usr/share/applications/mrstreamer.desktop"
  test "$(grep -c '^Exec=' "$desktop")" -eq 1
  grep -Fxq 'Exec="/opt/Mr. Streamer/mrstreamer" %U' "$desktop"
  sed -i 's|^Exec="/opt/Mr\. Streamer/mrstreamer" %U$|Exec=/opt/mrstreamer/mrstreamer %U|' "$desktop"
  grep -Fxq 'Exec=/opt/mrstreamer/mrstreamer %U' "$desktop"
  if grep -Fq '/opt/Mr. Streamer' "$desktop"; then
    return 1
  fi

  # fakeroot records root:root and the SUID sandbox helper in the pacman archive.
  # Match Arch's Electron packaging; never probe host namespaces or change host policy.
  install -m4755 'payload/opt/Mr. Streamer/chrome-sandbox' "$app/chrome-sandbox"

  # Only this copy becomes package-managed. Keep direct deb/AppImage artifacts unchanged.
  rm "$app/resources/package-type" "$app/resources/app-update.yml" \
    "$app/resources/apparmor-profile"
  printf '%s\n' '{"schema":1,"updates":"pacman"}' > "$app/resources/mrstreamer-installation.json"
  chmod 644 "$app/resources/mrstreamer-installation.json"

  local licenses="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 mrstreamer-LICENSE "$licenses/LICENSE"
  ln -s '/opt/mrstreamer/LICENSE.electron.txt' "$licenses/LICENSE.electron.txt"
  ln -s '/opt/mrstreamer/LICENSES.chromium.html' "$licenses/LICENSES.chromium.html"
  local notice
  for notice in LICENSE-FFmpeg.txt LICENSE-x264.txt LICENSE-dav1d.txt; do
    ln -s "/opt/mrstreamer/resources/ffmpeg/$notice" "$licenses/$notice"
  done
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  printf 'Release and bundled sources: %s\nApplication source: %s\n' \
    "https://github.com/Mr-Streamer-OSS/MrStreamer/releases/tag/v$_upstream_version" \
    "https://github.com/Mr-Streamer-OSS/MrStreamer/tree/$_source_commit" \
    > "$pkgdir/usr/share/doc/$pkgname/upstream.txt"
}
