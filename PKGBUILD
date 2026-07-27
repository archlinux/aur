# Maintainer: Eric Cañas <elcorreodeharu@gmail.com>

# This recipe is 0BSD (see LICENSE), which is a different thing from the MIT below:
# `license=('MIT')` is idlectl's licence, and 0BSD is this packaging's. The AUR
# submission rules ask for the second one, and without it the package cannot be promoted
# to the official repositories.

pkgname=idlectl
pkgver=0.3.0
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
#
# namcap will report the first three as "included, but may not be needed": it reads ELF
# linkage, and these are services this package talks to over a socket rather than
# libraries it links. They stay.
#
# `wayland` is deliberately NOT here even though the agent speaks the protocol. Measured
# on the built binary: no DT_NEEDED entry and no "libwayland" string anywhere in it, so
# neither linked nor dlopened -- wayland-client is compiled with its pure-Rust backend.
# Adding the dependency back would be a guess that contradicts `ldd`.
#
# libgcc, not gcc-libs. Since the GCC package split, gcc-libs is a meta-package that also
# pulls libasan, libtsan, libgfortran, libobjc, libquadmath and the rest of the sanitizer
# runtimes; the only thing these three binaries need is libgcc_s.so.1, which is libgcc.
depends=('systemd' 'dbus' 'polkit' 'libgcc' 'glibc')

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
sha256sums=('d356bc46c94810a4e97e934b9b0b9f3e9356a0392bbf3221cc9dd680d0d756c3')

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
	# CARGO_TARGET_DIR is passed on the command line rather than exported, because a make
	# command-line variable beats both the Makefile's `?=` and the environment.
	#
	# Not needed on the normal route -- measured rather than assumed: with
	# CARGO_TARGET_DIR exported to some other directory, `makepkg -f` still built and
	# packaged correctly, because build()'s own export mutates makepkg's process
	# environment and the fakeroot child inherits it.
	#
	# It IS needed under `makepkg -R`, which skips build() and therefore skips that
	# export. The same test there died in package() with `install: cannot stat
	# .../release/idlectl: No such file or directory`, the path being the inherited
	# CARGO_TARGET_DIR. It failed loudly only because that directory happened to be
	# empty: one already holding binaries of these three names would have been packaged
	# silently, which is the case this line actually defends against.
	make CARGO_TARGET_DIR=target DESTDIR="$pkgdir" prefix=/usr install
	# Upstream's own assertion that the package owns nothing under /etc and enables no
	# unit. Cheap, and it turns two invariants that a reviewer would otherwise take on
	# trust into a build failure.
	make CARGO_TARGET_DIR=target DESTDIR="$pkgdir" prefix=/usr verify-install
}
