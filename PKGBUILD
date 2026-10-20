# Maintainer: 郑祎
pkgname=fcitx5-windinput-bin
pkgver=0.127.0
pkgrel=1
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
sha256sums_x86_64=('678840f2aa458c9254be9bfdfbb929deb262a2e4b6e3f910a64047ef50b503d0')
sha256sums_aarch64=('13e3a69cd80613fde0208924c6b3e9b446a9d27f163233ef450626f33c510bd6')

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

  install -Dm644 "$srcdir/WindInput-$pkgver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/usr/lib/windinput/data/emoji/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/emoji-LICENSE"
}
