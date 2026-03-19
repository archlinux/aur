# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=radicle
pkgname=(radicle-{cli,node})
pkgver=1.7.0
pkgrel=1
pkgdesc="open source, peer-to-peer code collaboration stack built on Git"
arch=('x86_64')
license=('Apache-2.0 OR MIT')
_node="seed.radicle.xyz"
_rid="rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
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
_tag="releases/$pkgver"
source=(
	"heartwood::git+https://$_node/${_rid#rad:}.git#tag=$_tag"
	"0001-build-work-around-sccache-do-not-read-SOURCE_DATE_EP.patch"
	"0002-git-ref-format-fix-macros-for-debug_assertions.patch"
	"0003-git-ref-format-support-tests-with-debug_assertions.patch"
	"0004-node-fix-test_node_announcement_validate-for-debug_a.patch"
	"radicle-node.system."{service,socket}
	"radicle-node.user."{service,socket}
	"radicle-node.dnssd"
)
b2sums=('47c9771d76c868ab64539a9753ec6efc6dbe4a52d20cc10264a35ffcde3971f43071d7e4ecf40fcfce968f223e87a5958e89f6fe3b744705837876499c8fd612'
        'bd632d7337e8e5a8f8619c5ef872303b8c2b67bfb526e10b411776a7ffa16c92a0b9aad2f25c7d069133731d9b4520c66ec943ed4b6ba7b67167fc79722c2655'
        '7c6a23c1bda6c5d58dfd2e6bfc61885efcff6e1ca36ffe722c738498a441138d34b9322f6cbe60e0b78415ae34c5b735220162282d6f2275e84a7acf0bd82535'
        '11229e5efb343b33ea728c9688c13864bcc999d21c200551e550be2acfa0ddea234c16e016f06095d4fcd6d1115653ab9ba98c1670261230e0b05db18308c9fe'
        'd44e28571373221acf42f8f60b6d4024b715a8fe18d2fc24c289b0e8a56b98dcb4500043d72b7eb166cdc0f5cae7f9ab506c837c3dc6d0a0acb5da10ba16e1df'
        '14d3033ff232682b35d3f3a94436b86ad57f3be767e4681c18d1a8a4435968c31e0c36b5b617734035e75be144c99db7447be70741430962c614f0c17a59fecd'
        'ef60f99e65177accd1b34447dab134ad26b576050ff15c9bfd6483bacaef801106a6ff5694383b7446b366818b1545c6506ccd6d1b153532b99b15361ddd8e41'
        '18ade1de3d3195e8b4cfcb0c479d2f597b53cbb83bde559d69abd34587c8c45371c12e242621c92607c3202f2f4ee3fb21b462fc5150939f50744cc045baccff'
        '46872e0bd50bbf1528321de5522a9af95227fe43f7880db50968cfd1572a719bd55b874f56f55cd5d4e653565504799d1e54ac16cabe29f65a08089985fdaa27'
        '0276bce489e05115e7a63454aa0fa508d7bffba2add4249d1fcd449137104bc75882f5ff06077216fec5cbede5f2a1f8699e82bbc3fda3bf3b2354dfcf5dd0ac')

prepare() {
	cd heartwood

	# work around sccache brokenness around $SOURCE_DATE_EPOCH
	git apply -3 "$srcdir/0001-build-work-around-sccache-do-not-read-SOURCE_DATE_EP.patch"
	# fix git-ref-format macros in release mode
	git apply -3 "$srcdir/0002-git-ref-format-fix-macros-for-debug_assertions.patch"
	# fix tests in release mode
	git apply -3 "$srcdir/0003-git-ref-format-support-tests-with-debug_assertions.patch"
	git apply -3 "$srcdir/0004-node-fix-test_node_announcement_validate-for-debug_a.patch"

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
		-- \
		"${_test_skips[@]/#/--skip=}" \
		# EOL
	)
}

package_radicle-cli() {
	pkgdesc+=" - cli"

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

package_radicle-node() {
	pkgdesc+=" - node"

	cd heartwood
	install -Dm755 \
		target/dist/radicle-node \
		-t "$pkgdir/usr/bin"

	install -Dm644 \
		target/dist/man/radicle-node.1 \
		-t "$pkgdir/usr/share/man/man1"

	for _t in service socket; do
		install -Dm644 \
			"$srcdir/radicle-node.system.$_t" \
			"$pkgdir/usr/lib/systemd/system/radicle-node.$_t"
		install -Dm644 \
			"$srcdir/radicle-node.user.$_t" \
			"$pkgdir/usr/lib/systemd/user/radicle-node.$_t"
	done
	install -Dm644 \
		"$srcdir/radicle-node.dnssd" \
		-t "$pkgdir/usr/share/doc/$pkgname/systemd"

	install -Dm644 \
		LICENSE-MIT \
		LICENSE-APACHE \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
