# Maintainer: Arnaud Gissinger <claude@mathix.dev>

pkgname=alacritree-bin
_pkgname=alacritree
pkgver=0.14.0
pkgrel=1
pkgdesc="Native terminal that turns Git worktrees into workspaces, built on Alacritty (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/alacritree/alacritree"
license=('Apache-2.0')
depends=(
  'fontconfig'
  'freetype2'
  'libxkbcommon'
  'libxcb'
  'wayland'
  'libglvnd'
  # Runtime deps for the sidebar diff view: we shell out to `git diff … | delta`.
  'git'
  'git-delta'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'alacritree-git')

# The dist archives only carry the binary, so the XDG metadata comes straight
# from the repo at the release tag. Local names embed $pkgver so makepkg's
# source cache never reuses a stale copy from a previous release.
source=("$_pkgname-$pkgver.desktop::$url/raw/v$pkgver/alacritree/assets/alacritree.desktop"
        "$_pkgname-$pkgver-16.png::$url/raw/v$pkgver/alacritree/assets/icon-16.png"
        "$_pkgname-$pkgver-24.png::$url/raw/v$pkgver/alacritree/assets/icon-24.png"
        "$_pkgname-$pkgver-32.png::$url/raw/v$pkgver/alacritree/assets/icon-32.png"
        "$_pkgname-$pkgver-48.png::$url/raw/v$pkgver/alacritree/assets/icon-48.png"
        "$_pkgname-$pkgver-64.png::$url/raw/v$pkgver/alacritree/assets/icon-64.png"
        "$_pkgname-$pkgver-128.png::$url/raw/v$pkgver/alacritree/assets/icon-128.png"
        "$_pkgname-$pkgver-256.png::$url/raw/v$pkgver/alacritree/assets/icon-256.png"
        "$_pkgname-$pkgver-512.png::$url/raw/v$pkgver/alacritree/assets/icon-512.png")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
# Tag-pinned repo files never change once published; binary hashes are filled
# in by .github/workflows/aur-bin-publish.yml before the manifest is shipped
# to AUR.
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('21c310af6348eb17fd52ff796605d57d6f3334ef4627d7249c5f2aa36e1e9834')
sha256sums_aarch64=('a16ec598fe3d9f50eb594a7fed91d7f6052b5996e5521cd3b3bdaca4a74805db')

package() {
  # dist tarballs unpack into a root dir named after the archive.
  install -Dm755 "$srcdir/$_pkgname-$CARCH-unknown-linux-gnu/alacritree" \
    "$pkgdir/usr/bin/alacritree"
  install -Dm644 "$srcdir/$_pkgname-$pkgver.desktop" \
    "$pkgdir/usr/share/applications/alacritree.desktop"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/$_pkgname-$pkgver-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/alacritree.png"
  done
}
