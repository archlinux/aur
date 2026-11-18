# Maintainer: sliva0 <sliva0mk at gmail dot com>

pkgname=tgradish-static-bin
_pkgname=tgradish
pkgver=2.1.1
pkgrel=1
pkgdesc='Telegram stickers and emoji from videos, images or pixel art (ffmpeg built-in)'
arch=(x86_64 aarch64)
url='https://github.com/sliva0/tgradish'
# tgradish is MIT; the ffmpeg built in is LGPL, with libvpx, dav1d and zlib
license=(MIT LGPL-2.1-or-later BSD-3-Clause BSD-2-Clause Zlib)
# ffmpeg, libvpx, dav1d and zlib are linked in; the GUI loads the
# graphics libraries when it opens, and D-Bus for file dialogues
# the GUI's libraries are those of GUI_LIBRARIES in xtask/src/package.rs,
# which says where each comes from: keep them alike
depends=(
  dbus
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
optdepends=(
  'xdg-desktop-portal: file dialogues in the GUI'
  'ffmpeg: raw ffmpeg arguments (--ffmpeg-args), which need ffmpeg as a separate program'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip !debug)
# a release names its files alike in every version: here they are named
# by it, so a cache of downloads, as SRCDEST, keeps versions apart
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_x86_64=('e3c86270df71736e2f907c339dc6181f3bf051162c73f0fdad19e4df04abe161')
sha256sums_aarch64=('21fd084770547cf380a789ca6a31c211c013e8719fd6820beb8ab72975de88a5')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"
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
  # ffmpeg's, its libraries' and libwebp's licences, and where ffmpeg's
  # sources are
  install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
