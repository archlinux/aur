# Maintainer: firstpick <you@example.com>
pkgname=usrgrp-manager-git
pkgver=0.2.0.r16.gb782371
pkgrel=1
pkgdesc="Keyboard-driven TUI to view and manage UNIX users and groups (git version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/UsrGrp-Manager-TUI"
license=('MIT')
depends=('glibc' 'shadow')
makedepends=('git' 'rust' 'cargo')
provides=("usrgrp-manager=${pkgver}")
conflicts=('usrgrp-manager' 'usrgrp-manager-bin')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	
	# Get the version from Cargo.toml
	local cargo_version=$(grep '^version = ' Cargo.toml | head -1 | cut -d'"' -f2)
	
	# Get git describe info
	if git describe --long --tags 2>/dev/null | grep -q '^v'; then
		# If we have a version tag
		git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		# If no tags, use cargo version + revision count + short hash
		printf "%s.r%s.g%s" \
			"${cargo_version}" \
			"$(git rev-list --count HEAD)" \
			"$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd "${pkgname}"
	
	# Download/update cargo dependencies
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${pkgname}"
	
	# Build in release mode
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${pkgname}"
	
	# Run tests
	cargo test --frozen --all-features
}

package() {
	cd "${pkgname}"
	
	# Install the binary
	install -Dm755 "target/release/usrgrp-manager" "${pkgdir}/usr/bin/usrgrp-manager"
	
	# Install license file if it exists
	if [[ -f LICENSE ]]; then
		install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	fi
	
	# Install documentation if it exists
	if [[ -f README.md ]]; then
		install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	fi
}
