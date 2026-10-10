# Maintainer: 郑祎
pkgname=windinput-bin
pkgver=0.125.0
pkgrel=1
pkgdesc='WindInput Chinese input method for Fcitx5 (official Linux preview binaries)'
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
provides=("windinput=$pkgver")
conflicts=('windinput')
options=('!strip' '!debug')
install=windinput.install
source=("WindInput-$pkgver-LICENSE::https://raw.githubusercontent.com/huanfeng/WindInput/v$pkgver/LICENSE")
source_x86_64=("https://github.com/huanfeng/WindInput/releases/download/v$pkgver/WindInput-$pkgver-linux-amd64.deb")
source_aarch64=("https://github.com/huanfeng/WindInput/releases/download/v$pkgver/WindInput-$pkgver-linux-arm64.deb")
sha256sums=('43619c691546f1967bf997b0eab75a57cb5513d5c2679d444dfd1c087e53d310')
sha256sums_x86_64=('de54b04859c2f47ba086eab7d6fb92133e4896cfd6a54a74f6195cff9fbd3df3')
sha256sums_aarch64=('e7a70fe5602a31ec623a11d227d3a8e5f19ab3d7f52386da275720eef037bd38')

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
