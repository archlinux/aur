# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=openvaf-reloaded
pkgname=${_pkgname}-git
pkgver=r813.7afecc5
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
provides=("openvaf-r")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+${url}"
	"vacask::git+https://codeberg.org/arpadbuermen/VACASK#commit=42e5bcdec8376252023e78abe1ec141eb5498208"
)
b2sums=('SKIP'
        '24ace0387ef54d8da94b551bd940aac4f25210a56605b59c55375a84ea0d8ed5cc15b6daef524c1f734a81c406e2c9547bac3b78ba6ad7d9d27a5b04a42d9f82')

# lld fails to link mimalloc when LTO is enabled...
options=(!lto)

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
    	git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  	)
}

prepare() {
	cd "${_pkgname}"

	# Add the submodule(s)
	git submodule init
	# VACASK - for integration tests
	git config submodule."external/vacask".url "$srcdir/vacask"
	# Update submodule
	git -c protocol.file.allow=always submodule update --remote

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	# We need llvm major version
	local _llvm_ver=$(llvm-config --version)
	cargo build --frozen --release --features "llvm${_llvm_ver%%.*}"
}

check() {
	cd "${_pkgname}"
	# Use environment variables to control the extensiveness of the testing
	# default is to run none of the dev nor slow tests
	# RUN_DEV_TESTS=1 - Integration tests etc
	# RUN_SLOW_TESTS=1 - Slow/Large compilations?
	# ALL_TESTS=1 - Equivalent to RUN_DEV_TESTS=1 AND RUN_SLOW_TESTS
	if [[ "${ALL_TESTS}" > 0 ]]; then
		export RUN_DEV_TESTS=1
		export RUN_SLOW_TESTS=1
	fi
	# We need llvm major version
	local _llvm_ver=$(llvm-config --version)
	cargo test --frozen --features "llvm${_llvm_ver%%.*}"
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
