# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>

pkgname=hermes-one-bin
_pkgname=hermes-desktop
pkgver=0.7.6
pkgrel=1
pkgdesc="Hermes One — native desktop app for installing, configuring, and chatting with Hermes Agent"
arch=('x86_64')
url="https://github.com/fathah/hermes-desktop"
license=('MIT')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
provides=('hermes-one')
conflicts=('hermes-one')
options=('!strip')
source=(
  "$_pkgname-$pkgver.deb::https://github.com/fathah/hermes-desktop/releases/download/v$pkgver/hermes-desktop_${pkgver}_amd64.deb"
  "LICENSE::https://raw.githubusercontent.com/fathah/hermes-desktop/main/LICENSE"
)
sha256sums=(
  '9bbc2e0a828b706a3e47f2bde5a4fec0c1d709f1df21a92a1ecf55bdfa6b6732'
  '85d12b0f8894e7095f904a9a89fcfaea1b0d037cbfb4a12aba81daa87bcdbcd4'
)
noextract=("$_pkgname-$pkgver.deb")

package() {
  cd "$srcdir"

  # Extract the .deb
  ar x "$_pkgname-$pkgver.deb"

  # Unpack data.tar.xz into pkgdir
  mkdir -p data
  tar -xf data.tar.xz -C data

  # Install files preserving upstream layout
  cp -a data/. "$pkgdir/"

  # Rename icon to avoid conflict with the unrelated hermes-desktop AUR package
  find "$pkgdir/usr/share/icons" -name "hermes-desktop.png" -exec sh -c '
    for f; do
      dir=$(dirname "$f")
      mv "$f" "$dir/hermes-one.png"
    done
  ' sh {} +

  # Patch .desktop entry: fix icon name and binary symlink
  desktopfile="$pkgdir/usr/share/applications/hermes-desktop.desktop"
  sed -i "s/^Icon=hermes-desktop$/Icon=hermes-one/" "$desktopfile"
  sed -i "s|^Exec=.*$|Exec=hermes-one %U|" "$desktopfile"
  mv "$desktopfile" "$pkgdir/usr/share/applications/hermes-one.desktop"

  # Fix permissions on chrome-sandbox (SUID required for Electron sandboxing)
  chmod 4755 "$pkgdir/opt/Hermes One/chrome-sandbox" 2>/dev/null || true

  # Symlink binary to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Hermes One/hermes-desktop" "$pkgdir/usr/bin/hermes-one"

  # Install upstream MIT license
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}