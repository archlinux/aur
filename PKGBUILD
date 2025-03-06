# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="countryfetch"
pkgdesc="A neofetch-like tool for fetching information about your country"

pkgver=0.1.8
pkgrel=1

arch=(aarch64 i686 x86_64)

url="https://github.com/nik-rev/${pkgname}"
license=("MIT")

depends=(openssl)
makedepends=(cargo-nightly)
provides=("${pkgname}")

source=("https://github.com/nik-rev/${pkgname}/releases/download/v${pkgver}/source.tar.gz")
md5sums=("04433dc2067adc294257d2cf02059073")

prepare() {
	# move to the source directory
	cd "${pkgname}-${pkgver}"

	# use the system-provided openssl
	sed -i 's/openssl = { version = "0.10", features = \["vendored"\] }//' countryfetch/Cargo.toml

	# fetch required dependencies
	RUSTUP_TOOLCHAIN=nightly cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	# move to the source directory
	cd "${pkgname}-${pkgver}"

	# build the project
	RUSTUP_TOOLCHAIN=nightly CARGO_TARGET_DIR=target cargo build --release --all-features
}

check() {
	# move to the source directory
	cd "${pkgname}-${pkgver}"

	# run the tests
	RUSTUP_TOOLCHAIN=nightly cargo test --all-features
}

package() {
	# move to the source directory
	cd "${pkgname}-${pkgver}"

	# copy the executable and the license files
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
