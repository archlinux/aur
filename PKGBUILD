# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=pdf-tui
pkgver=0.2.0
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
conflicts=("$pkgname-git")
options=('!lto')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname/"
}
