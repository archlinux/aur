# Maintainer: OldJobobo
pkgbase=splinterm-bin
pkgname=('splinterm-bin' 'splinterm-mcp-bin')
pkgver=0.1.0alpha1
pkgrel=1
_commit=43b19d85e36a0f40fb28270d377d6cb02b4ea5c1
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
  '91a60d68025d2b428b625dbd5a49cd10fe7affd60db0e14ba113dfcce6aa632a'
  '7d9acdbd15eef7c3a881868bb273b05d7023a05b7ae30561c95d76970526c24e'
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
