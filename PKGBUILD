# Maintainer: xy-arch-git <333688328+xy-arch-git at users dot noreply dot github dot com>
#
# Prebuilt Linux x86_64 package. The tarball is produced by the public CI pipeline at
# https://github.com/xy-arch-git/dsh-desktop-linux and downloaded from its releases.
# Not affiliated with upstream.

pkgname=dsh-desktop-bin
pkgver=0.9.2
pkgrel=1
pkgdesc='Cross-platform desktop shell for DeepSeek Harness: local Agent runtime, model providers, mobile phone pairing, editable PPTX generation'
arch=('x86_64')
url='https://github.com/dataelement/dsh-desktop'
license=('MIT')
depends=('alsa-lib'
         'at-spi2-core'
         'brotli'
         'c-ares'
         'flac'
         'fontconfig'
         'freetype2'
         'gcc-libs'
         'glibc'
         'gtk3'
         'harfbuzz'
         'libdrm'
         'libevent'
         'libffi'
         'libjpeg-turbo'
         'libnotify'
         'libpulse'
         'libsecret'
         'libxcomposite'
         'libxdamage'
         'libxkbcommon'
         'libxrandr'
         'libxss'
         'libxtst'
         'libxml2'
         'libxslt'
         'minizip'
         'nss'
         'opus'
         'util-linux'
         'xdg-utils'
         'zlib')
optdepends=('libappindicator-gtk3: system tray icon support'
            'pipewire: WebRTC desktop sharing under Wayland')
provides=('dsh-desktop')
conflicts=('dsh-desktop')
# Bundled Electron must not be stripped; no debug package is needed either.
options=('!strip' '!debug')

_ghrepo='xy-arch-git/dsh-desktop-linux'
_archive="dsh-desktop-$pkgver-linux-x64.tar.zst"

# Asset layout: app/ (electron-builder linux-unpacked), dsh-desktop.desktop, icons/, LICENSE
source=("$pkgname-$pkgver.tar.zst::https://github.com/$_ghrepo/releases/download/v$pkgver/$_archive")
sha256sums=('b8198fe08c02e749730b55b3bb0198e14b52661058cc753b0d909b362a48330a')

package() {
  local src="$srcdir/dsh-desktop-$pkgver-linux-x64"
  [[ -d "$src/app" ]] || { echo "error: $src/app not found" >&2; exit 1; }

  install -d "$pkgdir/opt/dsh-desktop"
  cp -r "$src/app/." "$pkgdir/opt/dsh-desktop/"
  chmod 755 "$pkgdir/opt/dsh-desktop/dsh-desktop"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/dsh-desktop/dsh-desktop "$pkgdir/usr/bin/dsh-desktop"

  install -Dm644 "$src/dsh-desktop.desktop" \
    "$pkgdir/usr/share/applications/dsh-desktop.desktop"

  local png size
  for png in "$src"/icons/*.png; do
    size=$(basename "$png" .png)
    install -Dm644 "$png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/dsh-desktop.png"
  done

  install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
