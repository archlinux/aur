# Maintainer: Ruben Kharel <aur-at-rubenk-dot-dev>
pkgname=talecast-git
_pkgname=TaleCast
pkgver=r102.885ea21
pkgrel=2
pkgdesc="Simple CLI podcatcher"

arch=(
"x86_64"
"i686"
"armv7h"
"aarch64"
)
url="https://github.com/TBS1996/TaleCast"
license=("MIT")

makedepends=("cargo" "git")
depends=()
provides=("talecast")
conflict=("talecast")
sha256sums=("SKIP")
source=("git+${url}.git")

pkgver() {
	cd "${_pkgname}"
	# https://wiki.archlinux.org/title/VCS_package_guidelines#The_pkgver()_function
	# check which method to use from above docs
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Set CARGO_HOME to "${srcdir}/cargo"
  export CARGO_HOME="${srcdir}/cargo"
  if [ ! -d "${_pkgname}/dist" ]; then
        mkdir "${_pkgname}/dist"
  fi

  # Download Rust dependencies
  cd "${_pkgname}"
  cargo fetch --locked	
}

build() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features 
	# --frozen removed forzen for now
}

package() {
	# Set CARGO_HOME to "${srcdir}/cargo"
	export CARGO_HOME="${srcdir}/cargo"
	
	# Install binary
	install -Dm755 "${srcdir}/${_pkgname}/target/release/talecast" \
		"${pkgdir}/usr/bin/talecast"
}

pkgpostrm() {
	echo "To run talecast, execute 'talecast' in your terminal."
}
