# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: robertfoster <morf3089 at gmail dot com>

pkgname=codenomad-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='A fast, multi-instance workspace for running OpenCode sessions (Electron build)'
arch=('x86_64')
url='https://github.com/NeuralNomadsAI/CodeNomad'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libpulse'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
)
optdepends=(
  'opencode>=2.1.2: OpenCode V2 CLI (2.2.1 recommended) that drives the coding sessions'
  'git: repository and worktree features'
  'xdg-utils: open links with the desktop default handler'
)
provides=("codenomad=$pkgver")
conflicts=('codenomad' 'codenomad-git' 'codenomad-tauri-bin')
options=('!strip' '!debug')

_pkgname='CodeNomad'
_distname="${_pkgname}-Electron-linux-x64-${pkgver}"

source=("codenomad.desktop"
        "${pkgname}.LICENSE::${url}/raw/v${pkgver}/LICENSE"
        "${_distname}.deb::${url}/releases/download/v${pkgver}/${_distname}.deb")
noextract=("${_distname}.deb")
b2sums=('959ec0b4bb861e8e0947a71210cfa7448a34274a794786e2079a51ef20df825b917dc280668036b2ad5d4cb1671d7bb51206f33304bf3f902d39b38ccf5dd992'
        '1200e66eb498d10ee23b51c89c526716b1582bd0f0c7bcf45d78d4b4687e7e6d28002249e881e4c6c7e75d00775ce2bc2a32c4576e3fe51e8b5e09bc6de46920'
        '5743f22cc889e5820a9235e7a2055a22f6ac3315a36aed7b004bdc2c5c91ee10e2d87c26f6fbb843f32d7147085e82a244e624e782f23acc22f5fdfaa8d270d7')

package() {
  set -o pipefail
  bsdtar -xOf "$srcdir/${_distname}.deb" 'data.tar.*' | bsdtar -xf - -C "$pkgdir"
  mv "$pkgdir/opt/$_pkgname" "$pkgdir/opt/$pkgname"
  rm -f "$pkgdir/usr/share/applications/CodeNomad.desktop"
  rm -rf "$pkgdir/usr/share/doc" "$pkgdir/usr/share/icons"

  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  # The launcher pins the packaged UI and disables the remote UI downloader, so
  # upstream's self-update paths cannot replace package-owned files.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/codenomad" <<EOF
#!/bin/sh
export CLI_UI_DIR=/opt/$pkgname/resources/server/public
export CLI_UI_NO_UPDATE=1
exec /opt/$pkgname/CodeNomad "\$@"
EOF

  install -Dm644 "$srcdir/codenomad.desktop" \
    "$pkgdir/usr/share/applications/codenomad.desktop"
  install -Dm644 "$pkgdir/opt/$pkgname/resources/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/codenomad.png"

  install -Dm644 "$srcdir/${pkgname}.LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/opt/$pkgname/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$pkgdir/opt/$pkgname/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
  # 1.1.0 dropped the bundled Node runtime (and its LICENSE); npm now runs on
  # Electron's built-in Node, so ship npm's license instead.
  install -Dm644 "$pkgdir/opt/$pkgname/resources/node/linux-x64/npm/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.npm.txt"
}
