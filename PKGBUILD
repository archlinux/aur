# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=radicle-explorer-git
pkgname=(radicle-{explorer,httpd}-git)
pkgver=0.27.0.r2.gab514fe0d
pkgrel=1
pkgdesc="open source, peer-to-peer code collaboration stack built on Git"
arch=('x86_64')
license=('GPL-3.0-only' 'Apache-2.0 OR MIT')
_node="seed.radicle.dev"
_rid="rad:z4V1sjrXqjvFdnCUbxPFqd5p4DtH5"
url="https://app.radicle.dev/nodes/$_node/$_rid"
makedepends=(
	'git'
	'cargo'
	'asciidoctor'
	'nodejs'
	'npm'
	'pnpm'
	'libgit2' 'libgit2.so'
)
source=(
	"radicle-explorer::git+https://$_node/${_rid#rad:}.git"
	"radicle-explorer.config.json"
	"radicle-explorer.nginx.conf"
	"radicle-httpd.system.service"
	"radicle-httpd.user.service"
)
b2sums=('SKIP'
        'd29bf8a4344d407cdc19cce3d6d8ef2f28e97454c07978301ef1009a995ba8f352ad706b7230f33d290d7b055d8a8c80c80164625463adc4e0b1191b1c4573f2'
        '5735a8bae977e1fde93a294de1a7f738542f8c4d12d8efeed940c0a8f79f05a59c70101cf9faaa7207f034915e2ac189b0e4af7f0285610dbd9ecc0305d2601c'
        '3171cadeeb285a5baa9eebef8383ba4963c618db540a2480e60f08c4639c8f8fd18e8c435bfdd0f704cc3dcafb81fa91e97c1e5825d0144a62b3e3a5b32ef295'
        '75b438724669793478e4bfed2745c4e9c97e25f24863eabe2c0f7bbb72571bc6f572bc07092576678162a7c7cf1f861e2046a69f11bb1408597e1e98bbd5e2b6')

pkgver() {
	cd radicle-explorer
	git describe --long --tags | sed -r 's#^releases/##; s/^v//; s/-rc\./rc/; s/[^-]*-g/r&/; s/-/./g'
}

prepare() {
	cd radicle-explorer
	pnpm import
	pnpm install \
		--dangerously-allow-all-builds \
		--shamefully-hoist \
		# EOL

	cargo fetch --locked --target host-tuple
}

build() {
	cd radicle-explorer
	export VITE_RUNTIME_CONFIG=true
	pnpm --config.verifyDepsBeforeRun=false \
		build

	# _Disable_ cross-toolchain LTO because we are using different toolchains
	# for C/C++ and Rust code (i.e., LLVM LTO is incompatible with GCC LTO).
	# In this project, C/C++ code is linked into Rust code. Therefore, apply
	# a workaround to force generation of normal object code on C side:
	CFLAGS+=" -ffat-lto-objects"
	CXXFLAGS+=" -ffat-lto-objects"

	export LIBGIT2_NO_VENDOR=1
	export RADICLE_VERSION="$pkgver"
	cargo build \
		-p radicle-httpd \
		-p radicle-search \
		--frozen \
		--release \
		--bins \
		# EOL

	mkdir -p target/release/man
	for _man in crates/*/*.adoc; do
		asciidoctor --doctype manpage --backend manpage --destination-dir target/release/man "$_man"
	done
}

check() {
	cd radicle-explorer
	(
	# Ideally, we'd use `env -i`, but `cargo test` forces a recompilation
	# if build flags don't match (+ we want to test what we ship anyway).
	# As a stop-gap, unset variables that are known to break tests
	# (and might have been set in makepkg.conf).
	unset "${!GIT_@}"
	cargo test \
		-p radicle-httpd \
		-p radicle-search \
		--frozen \
		# EOL
	)
}

package_radicle-explorer-git() {
	pkgdesc+=" - explorer (frontend)"
	arch=(any)
	license=('GPL-3.0-only')
	depends=()
	optdepends=(
		'radicle-httpd: local backend for radicle-explorer'
	)
	provides=('radicle-explorer')
	conflicts=('radicle-explorer')

	cd radicle-explorer

	install -dm755 \
		"$pkgdir/usr/share/radicle-explorer"
	cp -dR --preserve=timestamps \
		build \
		-T "$pkgdir/usr/share/radicle-explorer"
	install -Dm644 \
		config/default.json \
		-T "$pkgdir/usr/share/radicle-explorer/config.json.example"
	# TODO: install into /etc?
	install -Dm644 \
		"$srcdir/radicle-explorer.config.json" \
		-T "$pkgdir/usr/share/radicle-explorer/config.json"

	install -Dm644 \
		LICENSE \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}

package_radicle-httpd-git() {
	pkgdesc+=" - explorer (backend)"
	license=('Apache-2.0 OR MIT')
	depends=(
		'glibc'
		'libgcc' 'libgcc_s.so'
		'libgit2' 'libgit2.so'
		'radicle-node'
	)
	provides=('radicle-httpd')
	conflicts=('radicle-httpd')

	cd radicle-explorer

	#
	# TODO: proper radicle-search integration
	#

	install -Dm755 \
		target/release/radicle-httpd \
		target/release/radicle-search \
		-t "$pkgdir/usr/bin"

	install -Dm644 \
		target/release/man/radicle-httpd.1 \
		-t "$pkgdir/usr/share/man/man1"

	install -Dm644 \
		"$srcdir/radicle-httpd.system.service" \
		"$pkgdir/usr/lib/systemd/system/radicle-httpd.service"
	install -Dm644 \
		"$srcdir/radicle-httpd.user.service" \
		"$pkgdir/usr/lib/systemd/user/radicle-httpd.service"
	install -Dm644 \
		"$srcdir/radicle-explorer.nginx.conf" \
		"$pkgdir/usr/share/doc/$pkgname/nginx/radicle-explorer.conf"

	install -Dm644 \
		crates/radicle-httpd/LICENSE-APACHE \
		crates/radicle-httpd/LICENSE-MIT \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
