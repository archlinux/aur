# Maintainer: Lokifisch <lokifisch@lokifisch.dev>
pkgname=nexo-client
pkgver=0.8.0
pkgrel=1
pkgdesc="Native Minecraft launcher — no webview, no bundled runtime"
arch=('x86_64' 'aarch64')
url="https://github.com/Lokifisch/nexo-client"
license=('MIT')
# The binary links only libc, libgcc_s and libm; wgpu and winit dlopen the
# entire graphics/windowing stack at runtime. namcap therefore infers almost
# nothing from the ELF and these must be listed by hand, or the package
# installs cleanly and then fails to open a window. Verified against the
# libraries actually mapped into a running process, not guessed.
# fontconfig is the exception: it isn't dlopen'd, but it supplies /etc/fonts,
# which is how the text stack discovers system fonts.
depends=(
	'vulkan-icd-loader'
	'libxkbcommon'
	'wayland'
	'libx11'
	'libxcursor'
	'libxi'
	'libxrandr'
	'fontconfig'
	'hicolor-icon-theme'
	'gcc-libs'
)
# makepkg's default LTO turns ring's C sources into GCC LTO objects, which
# rust-lld can't link ("undefined symbol: ring_core_..."). Rust packages on
# Arch switch it off for that reason.
options=('!lto')
makedepends=('cargo')
optdepends=(
	'jdk-openjdk: required to actually launch Minecraft (Java 25+)'
	'vulkan-radeon: Vulkan driver for AMD GPUs'
	'nvidia-utils: Vulkan driver for NVIDIA GPUs'
	'vulkan-intel: Vulkan driver for Intel GPUs'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a95e23c1ba6e880d982c506457bd25be6cbe072764e0ac90d34fb1151821f71')

prepare() {
	cd "$pkgname-$pkgver"
	# The repo pins a toolchain in rust-toolchain.toml, which would make a
	# rustup-based builder go fetch that exact version. RUSTUP_TOOLCHAIN takes
	# precedence over that file, so packaging builds use the system Rust.
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# Turns off the built-in self-updater: pacman owns /usr/bin/nexo, and a
	# binary replaced underneath it would desync the package's file list and
	# be silently reverted by the next -Syu. self_update.rs also refuses any
	# install under /usr on its own; this states the intent at the source.
	export NEXO_SELF_UPDATE=off
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	# Unit tests only. The `live_apis` contract tests are #[ignore]d because
	# they need network access, which a clean build chroot does not have.
	# The tests exercise the updater's own refusal rules, so they build it in:
	# the packaged binary compiles it out, see build().
	unset NEXO_SELF_UPDATE
	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	# Install rules live in the Makefile so this package, the Debian package,
	# and a plain `make install` can't drift apart.
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
