pkgname=rudolfs
pkgver=0.3.6
pkgrel=2
pkgdesc="A high-performance, caching Git LFS server with an AWS S3 and local storage back-end."
arch=(x86_64)
url="https://github.com/jasonwhite/rudolfs"
license=(MIT)
makedepends=(
cargo
)
depends=(
gcc-libs
glibc
)
checkdepends=(
git-lfs
)
optdpends=(
'git-lfs: local usage'
)
options=(!lto)  # see https://github.com/briansmith/ring/issues/1444 and https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20#note_171886
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jasonwhite/rudolfs/archive/${pkgver}.tar.gz")
sha256sums=('d61c64b9c7ef388208cc8782361d18b3a33b353ccaea7ca46d57b29433e2bd63')

prepare() {
	cd rudolfs-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

check() {
	cd rudolfs-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	cargo test --locked --offline --all-features
}


package() {
	cd rudolfs-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# TODO: figure out some what to use cargo install without triggering a full rebuild
	cargo install --no-track --locked --offline --all-features --target-dir target --root "$pkgdir/usr/" --path .
}

