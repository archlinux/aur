# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=yazi-nightly-bin
pkgver=0.3.0.20240808.407ad26
pkgrel=1
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
  'imagemagick: for SVG, Font, HEIC, and JPEG XL preview'
  'xclip: for system clipboard support'
  'wl-clipboard: for system clipboard support'
  'xsel: for system clipboard support'
)
_pkgname="yazi"
_date="$(date -u +%Y%m%d)"
source_x86_64=("$_pkgname-$_date-x86_64.zip::https://github.com/sxyazi/yazi/releases/download/nightly/yazi-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$_pkgname-$_date-aarch64.zip::https://github.com/sxyazi/yazi/releases/download/nightly/yazi-aarch64-unknown-linux-gnu.zip")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

prepare() {
  cd "$srcdir" || exit 1
  if [ "$CARCH" == "x86_64" ]; then
    bsdtar -xf "$_pkgname-$_date-x86_64.zip" --strip-components=1
  elif [ "$CARCH" == "aarch64" ]; then
    bsdtar -xf "$_pkgname-$_date-aarch64.zip" --strip-components=1
  fi
}

pkgver() {
  cd "$scrdir" || exit 1
  ./yazi --version | awk -F'[ ()]' '{gsub(/-/, "", $5); print $2 "." $5 "." $4}'
}

package() {
  cd "$srcdir" || exit 1

  install -Dm755 ya "$pkgdir/usr/bin/ya"
  install -Dm755 yazi "$pkgdir/usr/bin/yazi"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "$srcdir/completions" || exit 1
  install -Dm644 "_ya" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "_yazi" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "ya.bash" "$pkgdir/usr/share/bash-completion/completions/ya"
  install -Dm644 "yazi.bash" "$pkgdir/usr/share/bash-completion/completions/yazi"
  install -Dm644 "ya.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "yazi.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
