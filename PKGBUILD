# Maintainer: OldJobobo
pkgbase=splinterm-bin
pkgname=('splinterm-bin' 'splinterm-mcp-bin')
pkgver=0.1.1
# Candidate template only; publish after verified GitHub release publication.
# Candidate tooling must bind the commit and checksums.
pkgrel=1
_commit=136ef81d268d9734f5ffb687089859438ba99579
arch=('x86_64')
url='https://github.com/oldjobobo/splinterm'
license=('MIT')
options=('!strip' '!debug')
source=(
  "splinterm-$pkgver-$CARCH.pkg.tar.zst::https://github.com/OldJobobo/splinterm/releases/download/v0.1.1/splinterm-$_commit-$CARCH.pkg.tar.zst"
  "splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst::https://github.com/OldJobobo/splinterm/releases/download/v0.1.1/splinterm-mcp-$_commit-$CARCH.pkg.tar.zst"
)
noextract=(
  "splinterm-$pkgver-$CARCH.pkg.tar.zst"
  "splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst"
)
sha256sums=(
  '63fa181440433fdb351e71339554befdf75e7961e5a142aa03827c95fc886be5'
  '3572291ae5a9f7ea0d0adbd88e53be05159b05916a3992133af283e85f5decc7'
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
    'splinterm-mcp-bin: explicitly configured MCP stdio adapter'
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
