# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Upstream doesn't tag their source repository on releases, changes the version
# number in sources before actual releases, doesn't update their lock file in
# sync with anything, and doesn't organize their sources anything like what
# they publish as binaries. This package is a best-effort at reproducing
# something equivolent to their releases, but may not be the exact version of
# sources their built from at release time.

pkgbase=xet
pkgname=(git-xet xetcmd xetmnt)
pkgver=0.12.2
_sha=de87bc6055ff4b8a7f982bb84724097274e743fa
pkgrel=1
pkgdesc='CLI tools for working with XetHub'
arch=(x86_64)
url=https://xethub.com
license=(BSD)
depends=(gcc-libs
         glibc
         libz.so
         zlib)
makedepends=(cargo
             openssl)
_archive="xet-core-$_sha"
options=(!lto)
source=("https://github.com/xetdata/xet-core/archive/$_sha/$_archive.tar.gz")
sha256sums=('75c6198f2561bfa53fc295ac8a9cdc434b7fb3776b1cd2a6ead2ca8570fa4fe6')

prepare() {
	cd "$_archive/rust"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	sed -r -i -e '107s/mut //' gitxetcore/src/xetmnt/watch/metadata/filesystem.rs
}

build() {
	cd "$_archive/rust"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

_package_bin() {
	cd "$_archive/rust"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
}

package_git-xet() {
	_package_bin
}

package_xetcmd() {
	_package_bin
}

package_xetmnt() {
	depends+=(git-xet)
	_package_bin
}
