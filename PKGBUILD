pkgname=rudolfs
pkgver=0.3.7
_commit=e64a2142464b6cbdc0f14b5ca19a23470699e9c3
pkgrel=1
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
source=("git+https://github.com/jasonwhite/rudolfs.git#commit=${_commit}")
sha256sums=('0796c86e4a048478f12e131c0b736cf7acb3cf029808539390a22f45c135e28b')

pkgver() {
	cd rudolfs
	git describe --tags | sed 's/^v//'
}

prepare() {
	cd rudolfs
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

check() {
	cd rudolfs
	export RUSTUP_TOOLCHAIN=stable
	cargo test --locked --offline --all-features
}


package() {
	cd rudolfs
	export RUSTUP_TOOLCHAIN=stable
	# TODO: figure out some what to use cargo install without triggering a full rebuild
	cargo install --no-track --locked --offline --all-features --target-dir target --root "$pkgdir/usr/" --path .
}

