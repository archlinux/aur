# Maintainer: WindustH <windusth2006@gmail.com>

_pkgname=pdf-tui
pkgname=$_pkgname-git
pkgver=0.2.3.r0.g9a115e7
pkgrel=1
pkgdesc="Terminal PDF reader built with ratatui and terminal graphics protocols."
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/pdf-tui"
license=('MIT')
depends=('chafa' 'mupdf-tools' 'pdfium-binaries-bin' 'pdftk' 'poppler')
makedepends=('git' 'rust')
optdepends=(
  'perl-image-exiftool: edit PDF metadata'
  'wl-clipboard: copy selected text and PNGs on Wayland'
  'xclip: copy selected text and PNGs on X11'
  'xsel: copy selected text on X11'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname/"
}
