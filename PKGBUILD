# Maintainer: BrainDamage

pkgname=synapse-find-unreferenced-state-groups-git
# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"
pkgver=r11.e873f9a
pkgrel=1
pkgdesc="A tool to compress some state in a Synapse instance's database "
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/erikjohnston/synapse-find-unreferenced-state-groups"
makedepends=('rust' 'git')
license=('MIT')
source=("${_dirname}::git+https://github.com/erikjohnston/synapse-find-unreferenced-state-groups")
sha256sums=('SKIP')

# conflict/provide the same package as the non -git version
provides=("${_basename}")
conflicts=("${_basename}")

pkgver() {
	cd "${srcdir}/${_dirname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}

prepare() {
  cd "${srcdir}/${_dirname}"

  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${_dirname}"

	cargo build --release --locked

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --workspace --frozen --release --all-features
}

package() {
  cd "${srcdir}/${_dirname}"

  install -Dvm 0755 -t "${pkgdir}/usr/bin/" "target/release/rust-${_basename}"
}
