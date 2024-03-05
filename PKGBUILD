# Maintainer: Pig Fang <g-plane@hotmail.com>
# Contributor: SandaruKasa <sandarukasa+aur@ya.ru>

_pkgname=yazi
pkgname=yazi-git
pkgver=0.2.3.r30.g0cb572a
pkgrel=3
pkgdesc="Blazing fast terminal file manager written in Rust, based on async I/O."
url="https://github.com/sxyazi/yazi"
arch=("x86_64")
license=("MIT")
depends=(gcc-libs ttf-nerd-fonts-symbols)
optdepends=(
    'jq: for JSON preview'
    'unarchiver: for archive preview'
    'ffmpegthumbnailer: for video thumbnails'
    'fd: for file searching'
    'ripgrep: for file content searching'
    'fzf: for directory jumping'
    'poppler: for PDF preview'
    'zoxide: for directory jumping')
makedepends=(cargo git imagemagick)
options=(!lto)
provides=(yazi)
conflicts=(yazi)
source=("git+https://github.com/sxyazi/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"
  VERGEN_GIT_SHA="Arch Linux" YAZI_GEN_COMPLETIONS=true cargo build --release --frozen
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --frozen
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "assets/yazi.desktop" "$pkgdir/usr/share/applications/yazi.desktop"

  local r
  for r in 16 24 32 48 64 128 256; do
    install -dm755 "$pkgdir/usr/share/icons/hicolor/${r}x${r}/apps"
    convert assets/logo.png -resize "${r}x${r}" "$pkgdir/usr/share/icons/hicolor/${r}x${r}/apps/yazi.png"
  done

  cd "$srcdir/$_pkgname/$_pkgname-boot/completions"
  install -Dm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
