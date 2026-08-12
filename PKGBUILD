# Maintainer: OldJobobo
pkgbase=splinterm-bin
pkgname=('splinterm-bin' 'splinterm-mcp-bin')
pkgver=0.1.0alpha2
pkgrel=1
_commit=c6e711a2fdeef7c2e3bf5b9dac0b6f2f2c93ec5e
arch=('x86_64')
url='https://github.com/oldjobobo/splinterm'
license=('MIT')
options=('!strip' '!debug')
source=(
  "splinterm-$pkgver-$CARCH.pkg.tar.zst::https://github.com/OldJobobo/splinterm/releases/download/edge-$_commit/splinterm-$_commit-$CARCH.pkg.tar.zst"
  "splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst::https://github.com/OldJobobo/splinterm/releases/download/edge-$_commit/splinterm-mcp-$_commit-$CARCH.pkg.tar.zst"
)
noextract=(
  "splinterm-$pkgver-$CARCH.pkg.tar.zst"
  "splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst"
)
sha256sums=(
  'ddb84c4cd76035cd7fd1b6cf56827ba9736102a25966169c3384692afcc57e2f'
  '879c7dbd9f5dd7143ba22254a3421e9bd93a3df0b99537e102e18e378197c95b'
)

_extract_payload() {
  bsdtar -xpf "$1" -C "$pkgdir" \
    --exclude .BUILDINFO \
    --exclude .INSTALL \
    --exclude .MTREE \
    --exclude .PKGINFO
}

package_splinterm-bin() {
  pkgdesc='Persistent Wayland terminal for humans and bounded automation (prebuilt binary)'
  depends=(
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'libxkbcommon'
    'noto-fonts-cjk'
    'noto-fonts-emoji'
    'pixman'
    'python'
    'ttf-jetbrains-mono-nerd'
    'wayland'
    'xdg-terminal-exec'
  )
  optdepends=(
    'fcitx5: Wayland text-input support'
    'splinterm-mcp: explicitly configured MCP stdio adapter'
  )
  provides=("splinterm=$pkgver-$pkgrel")
  conflicts=('splinterm')
  install=splinterm.install

  _extract_payload "$srcdir/splinterm-$pkgver-$CARCH.pkg.tar.zst"
  mv "$pkgdir/usr/share/licenses/splinterm" \
    "$pkgdir/usr/share/licenses/splinterm-bin"
}

package_splinterm-mcp-bin() {
  pkgdesc='Policy-scoped MCP stdio adapter for Splinterm (prebuilt binary)'
  depends=("splinterm=$pkgver-$pkgrel" 'gcc-libs' 'glibc')
  provides=("splinterm-mcp=$pkgver-$pkgrel")
  conflicts=('splinterm-mcp')

  _extract_payload "$srcdir/splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst"
  mv "$pkgdir/usr/share/licenses/splinterm-mcp" \
    "$pkgdir/usr/share/licenses/splinterm-mcp-bin"
}
