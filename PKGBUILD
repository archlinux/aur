# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=noseyparker
pkgver=0.17.0
pkgrel=1
pkgdesc="find secrets and sensitive information in textual data and Git history"
arch=('x86_64')
url="https://github.com/praetorian-inc/noseyparker"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
	'cargo'
	'cmake'
  'pkgconfig' # Vectorscan dep
)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('67d78cd8379217032c396b51e196d6e7fe17c103a9716c7ecc22336b3133d5ae')
options=(!lto) # Vectorscan build fails with LTO
build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN="stable"
  export CARGO_BUILD_DIR="target/release"
  cargo build --locked --profile "release" --features "release"
}

check() {
	cd "$srcdir/${pkgname}-${pkgver}"
	if [[ "$(target/release/${pkgname}-cli --version | head -n1)" != "$pkgname ${pkgver}" ]]; then
		echo "Failed simple version check of built binary"
		exit 10
	else
		echo "Simple version check of built binary worked"
	fi
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm0755 "./target/release/${pkgname}-cli" "${pkgdir}/usr/bin/$pkgname"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  "./target/release/${pkgname}-cli" generate shell-completions --shell bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  mkdir -p "${pkgdir}/usr/share/fish/completions/"
  "./target/release/${pkgname}-cli" generate shell-completions --shell fish > "$pkgdir/usr/share/fish/completions/${pkgname}.fish"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  "./target/release/${pkgname}-cli" generate shell-completions --shell zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  mkdir -p "$pkgdir/usr/share/man/man1/"
  "./target/release/${pkgname}-cli" generate manpages --output "$pkgdir/usr/share/man/man1/"
}
