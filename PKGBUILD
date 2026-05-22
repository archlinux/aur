# Maintainer: kuro <kuro@kuro.moe>
# Contributor: kuro <kuro@kuro.moe>

pkgname=ender-dots
pkgver=2026.05.19
pkgrel=2
pkgdesc="AI-first Arch Linux ecosystem — KDE dotfiles, Neovim, OpenCode, Fish, Starship, Vicinae themes, custom Japanese OCR/study scripts, and automated workflows. Includes interactive TUI installer."
arch=('any')
url="https://github.com/kurojs/EnderDots"
license=('MIT')
depends=(
  'fish'
  'starship'
  'neovim'
  'git'
  'curl'
  'jq'
)
optdepends=(
  'opencode: AI-first IDE config'
  'zed: Zed editor config'
  'ghostty: Ghostty terminal config'
  'warp-terminal: Warp terminal config'
  'vicinae: Application launcher config and themes'
  'kwin: KDE window rules and tiling'
  'python: For custom scripts (OCR, Spotify, etc.)'
  'manga-ocr: Japanese OCR scripts'
  'ffmpeg: Audio playback for TTS scripts'
  'go: Build installer from source'
)
makedepends=('go')
source=("main.tar.gz::https://github.com/kurojs/EnderDots/archive/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/EnderDots-main/installer"
  go build -o ender-dots-installer -ldflags="-s -w" .
}

package() {
  cd "$srcdir/EnderDots-main"

  install -dm755 "$pkgdir/usr/share/$pkgname/.config"
  install -dm755 "$pkgdir/usr/share/$pkgname/.local"
  install -dm755 "$pkgdir/usr/share/$pkgname/home"
  install -dm755 "$pkgdir/usr/share/$pkgname/usr"
  install -dm755 "$pkgdir/usr/share/$pkgname/Docs"

  cp -r .config/* "$pkgdir/usr/share/$pkgname/.config/"
  cp -r .local/* "$pkgdir/usr/share/$pkgname/.local/"
  cp -r home/* "$pkgdir/usr/share/$pkgname/home/"
  cp -r usr/* "$pkgdir/usr/share/$pkgname/usr/"
  cp -r Docs/* "$pkgdir/usr/share/$pkgname/Docs/"
  [ -d .gemini ] && cp -r .gemini "$pkgdir/usr/share/$pkgname/"
  [ -d .zen ] && cp -r .zen "$pkgdir/usr/share/$pkgname/"

  install -Dm644 README.md "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/$pkgname/LICENSE"

  install -Dm755 installer/ender-dots-installer "$pkgdir/usr/bin/ender-dots"
}
