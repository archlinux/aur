# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=raspberry-fan-git
_pkgname=raspberry-fan
pkgver=0.1.0
pkgrel=1
pkgdesc='Fan control service for Raspberry Pi'
url='https://codeberg.org/pitbuster/raspberry-fan'
source=("git+https://codeberg.org/pitbuster/raspberry-fan")
arch=('aarch64')
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo' 'git')
sha512sums=('SKIP')
backup=('etc/raspberry-fan/config.kdl')

pkgver() {
  cd "${srcdir}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
  cd "${srcdir}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "${srcdir}"
	cargo build --frozen --release --all-features
}

package() {
	cd "${srcdir}"

	install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 config.kdl "${pkgdir}/etc/${_pkgname}/config.kdl"
	install -Dm644 ${_pkgname}.system -t "${pkgdir}/usr/lib/systemd/system/"
}
