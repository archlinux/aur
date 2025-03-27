# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=radicle-git
pkgname=(radicle-{cli,node}-git)
pkgver=1.7.0rc0.r12.g03bbe5241
pkgrel=1
pkgdesc="open source, peer-to-peer code collaboration stack built on Git"
arch=('x86_64')
license=('Apache-2.0 OR MIT')
url="https://radicle.xyz"
depends=(
	'glibc'
	'gcc-libs'
	'zlib'
	'git'
	'openssh'
)
makedepends=(
	'git'
	'cargo'
	'asciidoctor'
)
source=(
	"heartwood::git+https://seed.radicle.xyz/z3gqcJUoA1n9HaHKufZs5FCSGazv5.git"
	"systemd.patch"
)
b2sums=('SKIP'
        '02a9d5d6a3dbcdb2f2192bf9ffa28569fcf1e95fa9a43bbbc98bc26aa9e3a7d32cb0fa84d89a560c4c9431f8a027b34d57bd10071c0b02f4b9ce5a4bd465edd1')

pkgver() {
	cd heartwood
	git describe --long --tags | sed -r 's#releases/##; s/^v//; s/-rc\./rc/; s/[^-]*-g/r&/; s/-/./g'
}

prepare() {
	cd heartwood

	# sanitize provided systemd units
	git apply -3 "$srcdir/systemd.patch"

	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd heartwood

	# _Disable_ cross-toolchain LTO because we are using different toolchains
	# for C/C++ and Rust code (i.e., LLVM LTO is incompatible with GCC LTO).
	# In this project, C/C++ code is linked into Rust code. Therefore, apply
	# a workaround to force generation of normal object code on C side:
	CFLAGS+=" -ffat-lto-objects"
	CXXFLAGS+=" -ffat-lto-objects"

	export RADICLE_VERSION="$pkgver"
	cargo build \
		-p radicle-cli \
		-p radicle-node \
		-p radicle-remote-helper \
		--frozen \
		--release \
		--bins \
		# EOL

	mkdir -p target/release/man
	scripts/build-man-pages.sh target/release/man *.adoc

	# XXX: tests rebuild and overwrite some of the binaries
	cp -a target/release -T target/dist
}

check() {
	local _test_features=(
		radicle/test
		radicle-node/test
		radicle-crypto/test
		radicle-protocol/test
	)
	local _test_skips=(
		# flaky test
		rad_clone_partial_fail
	)

	cd heartwood
	(
	# Ideally, we'd use `env -i`, but `cargo test` forces a recompilation
	# if build flags don't match (+ we want to test what we ship anyway).
	# As a stop-gap, unset variables that are known to break tests
	# (and might have been set in makepkg.conf).
	unset "${!GIT_@}"
	# Tests fail with ENFILE, crank it up to eleven
	ulimit -n hard
	# Tests require the newly built tools, add them to $PATH
	PATH="$PWD/target/release:$PATH"
	cargo test \
		--frozen \
		--release \
		"${_test_features[@]/#/--features=}" \
		-- \
		"${_test_skips[@]/#/--skip=}" \
		# EOL
	)
}

package_radicle-cli-git() {
	pkgdesc+=" - cli"
	provides=('radicle-cli')
	conflicts=('radicle-cli')

	cd heartwood

	install -Dm755 \
		target/dist/rad \
		target/dist/git-remote-rad \
		-t "$pkgdir/usr/bin"

	install -Dm644 \
		target/dist/man/rad.1 \
		target/dist/man/rad-*.1 \
		target/dist/man/git-remote-rad.1 \
		-t "$pkgdir/usr/share/man/man1"

	install -Dm644 \
		LICENSE-MIT \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}

package_radicle-node-git() {
	pkgdesc+=" - node"
	provides=('radicle-node')
	conflicts=('radicle-node')

	cd heartwood
	install -Dm755 \
		target/dist/radicle-node \
		-t "$pkgdir/usr/bin"

	install -Dm644 \
		target/dist/man/radicle-node.1 \
		-t "$pkgdir/usr/share/man/man1"

	install -Dm644 \
		systemd/system/* \
		-t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 \
		systemd/user/* \
		-t "$pkgdir/usr/lib/systemd/user"
	install -Dm644 \
		systemd/dnssd/* \
		-t "$pkgdir/usr/share/doc/$pkgname/systemd"

	install -Dm644 \
		LICENSE-MIT \
		LICENSE-APACHE \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
