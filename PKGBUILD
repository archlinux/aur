# Maintainer: jaoppb <joaopedroperes06@gmail.com>
pkgname=cranky-git
# A placeholder, not kept up to date: pkgver() sets the version from the
# tags when the package is built.
pkgver=0.14.0.r234.gd8489a9
pkgrel=1
pkgdesc="A minimalist, performant, and modular bar for Hyprland (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jaoppb/cranky"
license=('MIT')
depends=('glibc' 'libgcc' 'libxkbcommon' 'fontconfig' 'dbus')
optdepends=('uwsm: for systemd session management')
makedepends=('cargo' 'pkgconf' 'git')
# The text rendering unit tests need a font, which a clean chroot lacks.
checkdepends=('ttf-dejavu')
provides=("cranky=${pkgver}")
conflicts=('cranky')
# makepkg's default lto compiles the vendored Lua to GCC LTO bytecode, which
# the Rust linker cannot read: the link fails on every lua_* symbol.
options=('!lto')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local version
	# Only release tags count: a tag that is not v followed by digits and dots
	# is skipped.
	version="$(git describe --long --tags --abbrev=7 --match 'v[0-9]*' --exclude 'v*[!0-9.]*' |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
	# makepkg writes the version into this file and sources it again, so a tag
	# that is not a plain version must stop the build here.
	if [[ ! "${version}" =~ ^[0-9]+(\.[0-9]+)*\.r[0-9]+\.g[0-9a-f]{7,}$ ]]; then
		printf 'error: git describe gave no plain version: %s\n' "${version}" >&2
		return 1
	fi
	printf '%s\n' "${version}"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	export CARGO_HOME="${srcdir}/cargo-home"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/${pkgname}"
	export CARGO_HOME="${srcdir}/cargo-home"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# A package build may use a newer Rust than rust-toolchain.toml pins; the
	# lints Cargo.toml denies must not fail it.
	export RUSTFLAGS="${RUSTFLAGS:-} --cap-lints warn"
	# makepkg strips, and splits cranky-git-debug when makepkg.conf asks for it;
	# the release profile's own strip would leave that package empty.
	export CARGO_PROFILE_RELEASE_STRIP=none
	cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}/${pkgname}"
	export CARGO_HOME="${srcdir}/cargo-home"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS="${RUSTFLAGS:-} --cap-lints warn"
	# Unit tests only: the integration tests need dbus-daemon, a headless sway
	# and grim, and tests/architecture.rs is a gate for the repository.
	cargo test --frozen --workspace --lib --bins
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 "target/release/cranky" "${pkgdir}/usr/bin/cranky"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/cranky/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "contrib/systemd/cranky.service" "${pkgdir}/usr/lib/systemd/user/cranky.service"
	install -Dm644 "contrib/systemd/cranky-uwsm.service" "${pkgdir}/usr/lib/systemd/user/cranky-uwsm.service"
}

