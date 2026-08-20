# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=radicle-git
pkgname=(radicle-{cli,node}-git)
pkgver=1.10.1.r8.gea66c657d
pkgrel=1
pkgdesc="open source, peer-to-peer code collaboration stack built on Git"
arch=('x86_64')
license=('Apache-2.0 OR MIT')
_node="seed.radicle.dev"
_rid="rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
url="https://radicle.dev"
depends=(
	'glibc'
	'libgcc' 'libgcc_s.so'
	'libgit2' 'libgit2.so'
)
makedepends=(
	'git'
	'cargo'
	'asciidoctor'
)
source=(
	"heartwood::git+https://$_node/${_rid#rad:}.git"
	"0001-build-work-around-sccache-do-not-read-SOURCE_DATE_EP.patch"
	"radicle-node.system."{service,socket}
	"radicle-node.user."{service,socket}
	"radicle-node.dnssd"
)
b2sums=('SKIP'
        '864190b259d2269ca412d11ca3998a2e35cdce72cd0b9127cda7788ad63ede1d8196a55aaf9df9b91805c6546d0dae81522dd2bb615aa787454687516e914086'
        '14d3033ff232682b35d3f3a94436b86ad57f3be767e4681c18d1a8a4435968c31e0c36b5b617734035e75be144c99db7447be70741430962c614f0c17a59fecd'
        'ef60f99e65177accd1b34447dab134ad26b576050ff15c9bfd6483bacaef801106a6ff5694383b7446b366818b1545c6506ccd6d1b153532b99b15361ddd8e41'
        '18ade1de3d3195e8b4cfcb0c479d2f597b53cbb83bde559d69abd34587c8c45371c12e242621c92607c3202f2f4ee3fb21b462fc5150939f50744cc045baccff'
        '46872e0bd50bbf1528321de5522a9af95227fe43f7880db50968cfd1572a719bd55b874f56f55cd5d4e653565504799d1e54ac16cabe29f65a08089985fdaa27'
        '0276bce489e05115e7a63454aa0fa508d7bffba2add4249d1fcd449137104bc75882f5ff06077216fec5cbede5f2a1f8699e82bbc3fda3bf3b2354dfcf5dd0ac')

pkgver() {
	cd heartwood
	git describe --long --tags | sed -r 's#releases/##; s/^v//; s/-rc\./rc/; s/[^-]*-g/r&/; s/-/./g'
}

prepare() {
	cd heartwood

	# work around sccache brokenness around $SOURCE_DATE_EPOCH
	git apply -3 "$srcdir/0001-build-work-around-sccache-do-not-read-SOURCE_DATE_EP.patch"

	cargo fetch --locked --target host-tuple
}

build() {
	cd heartwood

	# Some crates seem to hardcode or prefer clang; undo that
	export CC="${CC-gcc}"
	export CXX="${CXX-g++}"

	# _Disable_ cross-toolchain LTO because we are using different toolchains
	# for C/C++ and Rust code (i.e., LLVM LTO is incompatible with GCC LTO).
	# In this project, C/C++ code is linked into Rust code. Therefore, apply
	# a workaround to force generation of normal object code on C side:
	CFLAGS+=" -ffat-lto-objects"
	CXXFLAGS+=" -ffat-lto-objects"

	export LIBGIT2_NO_VENDOR=1

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
}

check() {
	local _test_skips=(
		# https://radicle.zulipchat.com/#narrow/stream/369277-heartwood/topic/Flaky.20tests/near/438352360
		"tests::e2e::test_connection_crossing"
		# https://radicle.zulipchat.com/#narrow/stream/369277-heartwood/topic/Clone.20Partial.20Fail.20Flake
		rad_clone_partial_fail
		# this test seems flaky
		rad_init_sync_preferred
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

package_radicle-node-git() {
	pkgdesc+=" - node"
	provides=('radicle-node')
	conflicts=('radicle-node')

	cd heartwood
	install -Dm755 \
		target/release/radicle-node \
		-t "$pkgdir/usr/bin"

	install -Dm644 \
		target/release/man/radicle-node.1 \
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

package_radicle-cli-git() {
	pkgdesc+=" - cli"
	provides=('radicle-cli')
	conflicts=('radicle-cli')

	cd heartwood

	install -Dm755 \
		target/release/rad \
		target/release/git-remote-rad \
		-t "$pkgdir/usr/bin"

	install -Dm644 \
		target/release/man/rad.1 \
		target/release/man/rad-*.1 \
		target/release/man/git-remote-rad.1 \
		-t "$pkgdir/usr/share/man/man1"

	# Completions
	"${pkgdir}/usr/bin/rad" completion bash \
	       | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/rad"
	"${pkgdir}/usr/bin/rad" completion zsh \
		| install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_rad"
	"${pkgdir}/usr/bin/rad" completion fish \
		| install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/rad.fish"

	install -Dm644 \
		LICENSE-MIT \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
