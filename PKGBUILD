# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154,2164
# shellcheck shell=bash

pkgname=yazi-nightly-bin
pkgver=25.4.8.20250411.bef4810
pkgrel=1
_date="$(date -u +%Y%m%d)"
pkgdesc="💥 Blazing fast terminal file manager written in Rust, based on async I/O."
arch=("x86_64" "aarch64")
url="https://yazi-rs.github.io"
license=("MIT")
conflicts=("yazi")
provides=("yazi")
depends=(ttf-nerd-fonts-symbols)
optdepends=(
  'ffmpegthumbnailer: for video thumbnails'
  'p7zip: for archive extraction and preview'
  'jq: for JSON preview'
  'poppler: for PDF preview'
  'fd: for file searching'
  'ripgrep: for file content searching'
  'fzf: for quick file subtree navigation'
  'zoxide: for historical directories navigation'
  'imagemagick: for Font, HEIC, and JPEG XL preview'
  'resvg: for SVG preview'
  'xclip: for Linux clipboard support'
  'wl-clipboard: for Linux clipboard support'
  'xsel: for Linux clipboard support'
)
source=("yazi-$_date-$CARCH.zip::https://github.com/sxyazi/yazi/releases/download/nightly/yazi-$CARCH-unknown-linux-gnu.zip")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/yazi-$CARCH-unknown-linux-gnu"
  ./yazi --version | awk -F'[ ()]' '{gsub(/-/, "", $5); print $2 "." $5 "." $4}'
}

package() {
  cd "$srcdir/yazi-$CARCH-unknown-linux-gnu"

  install -Dm755 ya "$pkgdir/usr/bin/ya"
  install -Dm755 yazi "$pkgdir/usr/bin/yazi"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "$srcdir/yazi-$CARCH-unknown-linux-gnu/completions"
  install -Dm644 "_ya" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "_yazi" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "ya.bash" "$pkgdir/usr/share/bash-completion/completions/ya"
  install -Dm644 "yazi.bash" "$pkgdir/usr/share/bash-completion/completions/yazi"
  install -Dm644 "ya.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "yazi.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
