#Maintainer: Walter Casanova - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo=" - base64

#indent = tab
#tab-size = 4

pkgname=ripgrep-all-git
_pkgname=ripgrep-all
pkgver=1.0.0.alpha.5.359.g3ccf371
pkgrel=1
pkgdesc="rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc."
arch=('i686' 'x86_64')
url="https://github.com/phiresky/ripgrep-all"
license=('AGPL3')
makedepends=('cargo' 'git')
checkdepends=('poppler')
optdepends=('ffmpeg' 'pandoc' 'poppler' 'tesseract' 'imagemagick')
depends=('ripgrep' 'xz')
conflicts=('ripgrep-all' 'ripgrep-all-bin')
source=("$_pkgname::git+https://github.com/phiresky/ripgrep-all")
sha1sums=('SKIP')
options=(!lto)

pkgver() {
	cd "$_pkgname"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

prepare() {
	cd ${_pkgname}
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}
package() {
	cd "$_pkgname"
	install -Dm755 "target/release/rga" "${pkgdir}/usr/bin/rga"
	install -Dm755 "target/release/rga-preproc" "${pkgdir}/usr/bin/rga-preproc"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.md"
}
