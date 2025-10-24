# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=openvaf-reloaded
pkgver=r747.d878f55
pkgrel=3
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

_commit="d878f5519b1767b64c6ebeb4d67e29e7cd46e60b" # FIXME: No releases yet - use a specific commit for now
source=("${pkgname}::git+${url}#commit=${_commit}")
b2sums=('02859461ee3ac8455cc23aded48d34c308e8f7c51a2d1bd140a4070f9bc220d79010b1afeef500bef3d4d3c094f2fa9a65a99ecf9a7453faacb7da7e1058c340')

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
