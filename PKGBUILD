# Maintainer: sliva0 <sliva0mk at gmail dot com>

pkgname=tgradish-bin
_pkgname=tgradish
pkgver=2.1.0
pkgrel=1
pkgdesc='Telegram stickers and emoji from videos, images or pixel art'
arch=(x86_64 aarch64)
url='https://github.com/sliva0/tgradish'
license=(MIT BSD-3-Clause)
# the release build without ffmpeg, which runs the system's; the GUI
# loads the graphics libraries when it opens, and D-Bus for file dialogues
# the GUI's libraries are those of GUI_LIBRARIES in xtask/src/package.rs,
# which says where each comes from: keep them alike
depends=(
  dbus
  ffmpeg
  gcc-libs
  glibc
  libglvnd
  libx11
  libxcb
  libxcursor
  libxi
  libxkbcommon
  libxkbcommon-x11
  libxrender
  wayland
)
optdepends=('xdg-desktop-portal: file dialogues in the GUI')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip !debug)
# a release names its files alike in every version: here they are named
# by it, so a cache of downloads, as SRCDEST, keeps versions apart
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64-system-ffmpeg.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64-system-ffmpeg.tar.gz")
sha256sums_x86_64=('4a0cb361897c9b216e5ed079312552915c54ca218beccec8c4a2d0e908e69acc')
sha256sums_aarch64=('95e3d7d2cbcb14eb2291db9641d772b27ef4898049252003958a65110510b018')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH-system-ffmpeg"
  install -Dm755 tgradish -t "$pkgdir/usr/bin/"
  install -Dm644 man/*.1.gz -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 completions/tgradish.bash "$pkgdir/usr/share/bash-completion/completions/tgradish"
  install -Dm644 completions/_tgradish -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 completions/tgradish.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 completions/tgradish.nu -t "$pkgdir/usr/share/nushell/vendor/autoload/"
  install -Dm644 tgradish.desktop -t "$pkgdir/usr/share/applications/"
  for icon in icons/hicolor/*/apps/tgradish.png; do
    install -Dm644 "$icon" "$pkgdir/usr/share/$icon"
  done
  install -Dm644 README.md THIRD-PARTY.txt THIRD-PARTY-CRATES.txt -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # libwebp's licence and patent grant
  install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
