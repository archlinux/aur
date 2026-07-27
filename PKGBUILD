# Maintainer: Eric Cañas <elcorreodeharu@gmail.com>

pkgname=idlectl
pkgver=0.1.0
pkgrel=1
pkgdesc='Idle policy daemon that decides when a machine may blank, suspend, hibernate or power off'
arch=('x86_64' 'aarch64')
url='https://github.com/Eric-Canas/cachyos-idlectl'
license=('MIT')

# systemd for logind (sessions, inhibitors, the Suspend/PowerOff calls) and for the unit
# directories; dbus for the system bus the interface lives on; polkit because every
# state-changing method is gated by an action rather than by a uid check written here.
# Without polkit the daemon still runs, but only uid 0 may call anything, which is not a
# configuration anybody wants by accident.
depends=('systemd' 'dbus' 'polkit' 'gcc-libs' 'glibc' 'wayland')

# cargo is provided by both `rust` and `rustup`; scdoc builds the three man pages and the
# Makefile fails loudly rather than skipping them, so it is a hard build dependency.
makedepends=('cargo' 'scdoc')

# nvidia-smi is one of the two GPU sources, and on a hybrid machine it is the one that can
# see the discrete card: the integrated GPU publishes DRM fdinfo while the discrete one
# does not, so without this the memory-holder facts read false with a game running.
optdepends=('nvidia-utils: GPU memory detection on NVIDIA cards')

install="$pkgname.install"

# The upstream repository is `cachyos-idlectl`; the package, the binaries and the
# interface are `idlectl`. GitHub names the tarball's top directory after the repository,
# hence the separate variable rather than the usual "$pkgname-$pkgver".
_srcname="cachyos-idlectl-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fb36988f11e50d9b6cff51b51f9cdbb6294d6ebf0e0ca07f1ca1dc5c13b4d1b')

prepare() {
	cd "$_srcname"
	# Upstream ships no rust-toolchain.toml on purpose -- pinning one inside a build
	# chroot either downloads a second toolchain or is ignored -- but a directory
	# override left behind by a developer would still be honoured. This pins the build
	# to the default stable toolchain when cargo comes from rustup, and is a no-op when
	# it comes from the `rust` package.
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_srcname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# `make build` is the packaging contract upstream documents: it builds the three
	# binaries and the man pages. --frozen because prepare() already vendored the
	# dependencies and the lock file must not move during a package build.
	make build CARGO_FLAGS='--frozen'
}

check() {
	cd "$_srcname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# --release so the tests reuse the artifacts build() just produced instead of
	# compiling the whole workspace a second time in debug.
	make test CARGO_FLAGS='--frozen --release'
}

package() {
	cd "$_srcname"
	make DESTDIR="$pkgdir" prefix=/usr install
	# Upstream's own assertion that the package owns nothing under /etc and enables no
	# unit. Cheap, and it turns two invariants that a reviewer would otherwise take on
	# trust into a build failure.
	make DESTDIR="$pkgdir" prefix=/usr verify-install
}
