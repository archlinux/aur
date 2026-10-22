# Maintainer: serverjonas dev@serverjonas.de
# Contributor: serverjonas dev@serverjonas.de

pkgname=sjcopy
pkgver=0.1.0
pkgrel=1
pkgdesc='Copy terminal output to named, automatically expiring stores (copy) and read it back byte-exact (paste)'
arch=('x86_64')
url='https://git.serverjonas.de/Serverjonas/tinyproject-monorepo'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')

# Upstream does not tag releases; this is a monorepo and the project lives in
# sjcopy/sjcopy. Pin the exact commit for reproducible builds and keep pkgver
# in sync with the version in sjcopy/sjcopy/Cargo.toml.
_repo='tinyproject-monorepo'
_commit='c6a3393830b320fbe72f1b63061017dd1ab1c536'
_projectdir="$_repo-$pkgver/sjcopy/$pkgname"
source=("$_repo-$pkgver::git+$url.git#commit=$_commit")
# VCS sources are never checksummed.
sha256sums=('SKIP')

# Binaries must not be installed as "copy"/"paste": "paste" collides with
# GNU coreutils in /usr/bin. The sj prefix matches the README's naming advice.
_sjbin_prefix='sj'

prepare() {
	cd "$_projectdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_projectdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR="$srcdir/target"
	cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
}

check() {
	cd "$_projectdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR="$srcdir/target"
	cargo test --frozen --release --target "$CARCH-unknown-linux-gnu"
}

package() {
	cd "$_projectdir"

	install -Dm 0755 "$srcdir/target/$CARCH-unknown-linux-gnu/release/copy" \
		"$pkgdir/usr/bin/${_sjbin_prefix}copy"
	install -Dm 0755 "$srcdir/target/$CARCH-unknown-linux-gnu/release/paste" \
		"$pkgdir/usr/bin/${_sjbin_prefix}paste"

	# Only valid once a LICENSE file exists at the project root. With
	# license=('MIT') and no license file, makepkg/lint will complain.
	if [[ -f LICENSE ]]; then
		install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m 0644 LICENSE
	fi
}
