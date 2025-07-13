# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=openvaf-reloaded
pkgver=r730.802bce2
pkgrel=2
pkgdesc="Continuation of OpenVAF - A Next-generation VerilogA Compiler - OSDI >= 4 support"
arch=(
	"x86_64"
	"aarch64"
)
url="https://github.com/OpenVAF/OpenVAF-Reloaded"
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
options=(!lto)
provides=("openvaf-r")

_commit="802bce21ac44833b52c010cb90d37e0d6fddd4ac" # FIXME: No releases yet - use a specific commit for now
source=(
	"${pkgname}::git+${url}#commit=${_commit}"
	"0001-integration_test_fix.patch"
)
b2sums=(
	'4f78dffa89e24bf97b094bba876a0637a0a5cb16c92d6966bc95bde69195bb1afb5544f37f036167fcf1cd065bad11bf4dd3c6fe5603e2c3c716c1af5a0a004f'
	'e696f1d39a93a9c47d12926c8c9988494c656653d5822c4a894eb11c54f01b9cf4ba07e6a3e522545750577be77addf2622de7980fa1169b4f068602186ee028'
)

pkgver() {
	# FIXME: Add custom version since there's no tagged release
	cd "$pkgname"
	( set -o pipefail
    	git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  	)
}

prepare() {
	cd "$pkgname"

	# Add PR/Patch which crashes integration tests:
	# See https://github.com/OpenVAF/OpenVAF-Reloaded/pull/9
	patch -p1 < ../0001-integration_test_fix.patch

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
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
