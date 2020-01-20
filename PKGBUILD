# Maintainer: walter <wcasanova [at] disroot dot com>
pkgname=ripgrep-all-git
_pkgname=ripgrep-all
pkgver=0.9.4.alpha.0.154.g235ee0a
pkgrel=1
pkgdesc="rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc."
arch=('i686' 'x86_64')
url="https://github.com/phiresky/ripgrep-all"
license=('AGPL3')
makedepends=('cargo' 'git')
optdepends=('ffmpeg' 'pandoc' 'poppler' 'tesseract' 'imagemagick')
depends=('ripgrep')
conflicts=('ripgrep-all' 'ripgrep-all-bin')
source=("$pkgname::git+https://github.com/phiresky/ripgrep-all")
sha1sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

build() {
    cd $pkgname
    export SHELL_COMPLETIONS_DIR="$PWD/completions"
    cargo build --release --locked
}
    
check() {
    cd $pkgname
    cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/rga" "${pkgdir}/usr/bin/rga"
  install -Dm755 "target/release/rga-preproc" "${pkgdir}/usr/bin/rga-preproc"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

#package() {
#    cd "$srcdir/$_pkgname"
#    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
#    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
