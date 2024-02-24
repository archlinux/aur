# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=noseyparker
pkgver=0.16.0
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
  'ragel'     # Vectorscan dep
  'pkgconfig' # Vectorscan dep
  'sqlite'    # Vectorscan dep
  'libpcap'   # Vectorscan dep
)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('8086426ccfc714084d3e3aa4f5dfaa2cf5add970ba90daa1a49924a7b5456e51')
options=(!lto)
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
  "./target/release/${pkgname}-cli" shell-completions --shell bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  mkdir -p "${pkgdir}/usr/share/fish/completions/"
  "./target/release/${pkgname}-cli" shell-completions --shell fish > "$pkgdir/usr/share/fish/completions/${pkgname}.fish"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  "./target/release/${pkgname}-cli" shell-completions --shell zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
