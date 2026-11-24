# Maintainer: 郑祎
pkgname=fcitx5-windinput-bin
pkgver=0.133.0
pkgrel=2
pkgdesc='基于 Debian 发行包重打包的清风输入法 Fcitx5 Linux 预览版'
arch=('x86_64' 'aarch64')
url='https://windinput.com'
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'dbus'
  'fcitx5>=5.0.14'
  'fontconfig'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libxcb'
  'libxkbcommon'
  'procps-ng'
  'python'
  'wayland'
  'xz'
)
optdepends=(
  'fcitx5-configtool: add WindInput to your input method group'
  'fcitx5-gtk: input method support for GTK applications'
  'fcitx5-qt: input method support for Qt applications'
  'noto-fonts-cjk: Chinese text rendering, unless another CJK font is installed'
  'noto-fonts-emoji: color emoji rendering'
  'xclip: clipboard support on X11'
  'wl-clipboard: clipboard support on Wayland'
  'xdg-utils: open links and associated files'
  'xdg-desktop-portal: file dialogs, requires a desktop-specific portal backend'
  'zenity: fallback file dialogs'
)
provides=("windinput=$pkgver" "windinput-bin=$pkgver")
conflicts=('windinput' 'windinput-bin')
options=('!strip' '!debug')
install=windinput.install
source=("WindInput-$pkgver-LICENSE::https://raw.githubusercontent.com/huanfeng/WindInput/v$pkgver/LICENSE")
source_x86_64=("https://github.com/huanfeng/WindInput/releases/download/v$pkgver/WindInput-$pkgver-linux-amd64.deb")
source_aarch64=("https://github.com/huanfeng/WindInput/releases/download/v$pkgver/WindInput-$pkgver-linux-arm64.deb")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('3fc94444ae4a473854f2c17d762fd3c0cac67f567e22067154b21c930b26af6d')
sha256sums_aarch64=('db73b75e18e277abb778b7adc8587450cc8d77a97df0d6102b7c511a360c77d7')

package() {
  local _multiarch
  case "$CARCH" in
    x86_64) _multiarch=x86_64-linux-gnu ;;
    aarch64) _multiarch=aarch64-linux-gnu ;;
  esac

  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"

  # Fcitx5 on Arch does not search Debian's multiarch library directories.
  install -Dm644 "$pkgdir/usr/lib/$_multiarch/fcitx5/libwindinput.so" \
    "$pkgdir/usr/lib/fcitx5/libwindinput.so"
  rm -r "$pkgdir/usr/lib/$_multiarch"

  # The Debian package installs an xkb symbols file under /usr/share/X11/xkb so
  # that sessions which use "windinput" as XKB layout name still compile a
  # keymap (issue #331: Chromium/QtWebEngine abort when libxkbcommon cannot
  # find symbols/windinput). On Arch /usr/share/X11/xkb is a symlink owned by
  # xkeyboard-config, so shipping that path (or the directory entry) conflicts
  # with it and --overwrite would destroy the symlink. Install the symbols file
  # to /etc/xkb instead: libxkbcommon searches it by default
  # (XKB_CONFIG_EXTRA_PATH) and no package owns it.
  install -Dm644 "$pkgdir/usr/share/X11/xkb/symbols/windinput" \
    "$pkgdir/etc/xkb/symbols/windinput"
  rm -rf "$pkgdir/usr/share/X11"

  install -Dm644 "$srcdir/WindInput-$pkgver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/usr/lib/windinput/data/emoji/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/emoji-LICENSE"
}
