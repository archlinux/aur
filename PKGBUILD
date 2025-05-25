# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname="countryfetch"
pkgname="${_pkgname}-git"

pkgdesc="A neofetch-like tool for fetching information about your country (git version)"

pkgver=0.1.9.r15.g4b7ceaf
pkgrel=1

arch=(aarch64 i686 x86_64)

url="https://github.com/nik-rev/${_pkgname}"
license=(Apache-2.0 MIT)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

depends=(gcc-libs openssl)
makedepends=(cargo git)

source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
	# move to the source directory
	cd "${_pkgname}"

	# use the most recent annotated tag reachable from the last commit
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# move to the source directory
	cd "${_pkgname}"

	# use the system-provided openssl
	sed -i 's/openssl = { version = "0.10", features = \["vendored"\] }//' "${_pkgname}/Cargo.toml"

	# fetch required dependencies
	RUSTUP_TOOLCHAIN=stable cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	# move to the source directory
	cd "${_pkgname}"

	# build the project
	RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo build --release --all-features
}

check() {
	# move to the source directory
	cd "${_pkgname}"

	# run the tests
	RUSTUP_TOOLCHAIN=stable cargo test --all-features
}

package() {
	# move to the source directory
	cd "${_pkgname}"

	# copy the executable
	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# copy the license and readme files
	install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
