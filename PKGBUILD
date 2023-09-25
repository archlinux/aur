# Maintainer: Pig Fang <g-plane@hotmail.com>
# Contributor: SandaruKasa <sandarukasa+aur@ya.ru>

_pkgname=yazi
pkgname=yazi-git
pkgver=0.1.4.r57.gcb13de9
pkgrel=2
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
makedepends=(cargo git)
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
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --frozen
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

