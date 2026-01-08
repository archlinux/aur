# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=openvaf-reloaded
pkgname=${_pkgname}-git
pkgver=r771.fce38d8
pkgrel=1
pkgdesc="Continuation of OpenVAF - A Next-generation VerilogA Compiler - OSDI >= 4 support"
arch=(
	"x86_64"
	"aarch64"
)
# NOTE: Arpad's fork seems to be more like the dev version
# while the OpenVAF is a downstream of Arpad's fork++
# url="https://github.com/OpenVAF/OpenVAF-Reloaded"
url="https://github.com/arpadbuermen/OpenVAF"
license=('GPL-3.0-or-later')
depends=(
	"glibc"
	"gcc-libs"
	"llvm-libs"
)
makedepends=(
	"git"
	"cargo"
	"clang" 
	"llvm"
	"lld"
	"python"
)
optdepends=(
	"python: For running verilogae to obtain equations of compact models"
)
provides=("openvaf-r")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
b2sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
    	git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  	)
}

prepare() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${_pkgname}"
	cargo test --frozen --all-features
}

package() {
	cd "${_pkgname}"
	# Executables
	install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/openvaf-r"
	install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/verilogae"
	# FIXME: What's xtask?
	# install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/xtask"
	# Libs
	install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "target/release/libverilogae.so"
	install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "target/release/libverilogae_py.so"
	# License
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
}
