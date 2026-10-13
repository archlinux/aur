# Maintainer: 郑祎
pkgname=fcitx5-windinput-bin
pkgver=0.126.0
pkgrel=1
pkgdesc='基于 Debian 发行包重打包的清风输入法 Fcitx5 Linux 预览版'
arch=('x86_64' 'aarch64')
url='https://windinput.com'
license=('MIT' 'LGPL-3.0-only')
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
sha256sums=('43619c691546f1967bf997b0eab75a57cb5513d5c2679d444dfd1c087e53d310')
sha256sums_x86_64=('96222852b853bb1e7b464812032bbb1b5e63c3ee945e8060611f663b73453541')
sha256sums_aarch64=('430fe0bd9815e497afabd043a9fdda3d356a0249680f61d006c89b2647cc1bc1')

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
