# Maintainer: Arnaud Gissinger <claude@mathix.dev>

pkgname=alacritree-bin
_pkgname=alacritree
pkgver=0.5.1
pkgrel=1
pkgdesc="Alacritty fork with worktree-aware sidebars (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mathix420/alacritree"
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
sha256sums_x86_64=('00ec9cb0451c3c7ec1abc57f0438d17aeb36753a1fa227a03b114487904cb3b4')
sha256sums_aarch64=('7cb4e94441019ed519f3ab2909c03de7ee4a41be0289473fab08973f6acc270f')

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
