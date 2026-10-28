# Maintainer: Artiom Molchanov <av.m@gmx.fr>

pkgname=farplay-bin
pkgver=1.4.0
_build=1472
pkgrel=1
pkgdesc='Ultra-low latency audio and video for playing music online'
arch=('x86_64')
url='https://farplay.io/'
license=('LicenseRef-proprietary')
depends=(
  'alsa-lib'
  'dbus'
  'fontconfig'
  'freetype2'
  'glib2'
  'gnutls'
  'hicolor-icon-theme'
  'jack'
  'krb5'
  'libglvnd'
  'libpulse'
  'libx11'
  'libxcb'
  'libxext'
  'libxkbcommon'
  'libxkbcommon-x11'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'zlib'
)
optdepends=(
  'gtk3: GTK platform theme'
)
provides=('farplay')
conflicts=('farplay')
options=('!strip')
# https://farplay.io/item?reltag=v1.4.0&id=farplay-1.4.0-1472_lnx.tgz redirects here.
# Self-contained Qt 5 build; Qt, FFmpeg, and OpenSSL 1.1 are bundled.
source=(
  "https://github.com/FarPlayIO/farplay-bin/releases/download/v${pkgver}/farplay-${pkgver}-${_build}_lnx.tgz"
  'LICENSE'
)
sha256sums=(
  'e089b7e0e3f379d748585b7b7e6231ec2381c427676f1d670d1bdcf2107a2600'
  '7f6f59a0716e86fb851e2df1cf34603952d09462ad2f5c80feaecd9d52cdd8a6'
)

package() {
  cd "farplay-${pkgver}"

  install -dm755 "$pkgdir/opt/farplay"
  cp -a --no-preserve=ownership farplay lib plugins FarPlay.png "$pkgdir/opt/farplay/"

  # Bundled Qt was built with prefix /home/qt/work/install and resolves
  # plugins relative to this file when that prefix is absent.
  printf '%s\n' \
    '[Paths]' \
    'Prefix = .' \
    'Libraries = lib' \
    'Plugins = plugins' \
    > "$pkgdir/opt/farplay/qt.conf"

  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' \
    '#!/bin/sh' \
    'exec /opt/farplay/farplay "$@"' \
    > "$pkgdir/usr/bin/farplay"
  chmod 755 "$pkgdir/usr/bin/farplay"

  install -Dm644 farplay.desktop "$pkgdir/usr/share/applications/farplay.desktop"
  sed -i \
    -e 's/^Version=.*/Version=1.1/' \
    -e 's|^Exec=.*|Exec=/usr/bin/farplay --url=%u|' \
    -e 's|^TryExec=.*|TryExec=/usr/bin/farplay|' \
    -e 's|^MimeType=.*|MimeType=x-scheme-handler/farplay;|' \
    "$pkgdir/usr/share/applications/farplay.desktop"

  install -Dm644 FarPlay.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/FarPlay.png"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
