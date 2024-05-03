pkgname=wasm-component-ld
pkgver=0.3.0
_commit=8e54a44a36e6fa5c15231592e09b5fac5a0adb5a
pkgrel=1
pkgdesc="Command line linker for creating WebAssembly components"
arch=(x86_64)
url="https://github.com/bytecodealliance/wasm-component-ld"
license=(MIT APACHE APACHE-2.0)
makedepends=(
cargo
git
)
depends=(
gcc-libs
glibc
)
#options=(!lto)  # see https://github.com/briansmith/ring/issues/1444 and https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20#note_171886
source=("git+https://github.com/bytecodealliance/wasm-component-ld.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd wasm-component-ld
	git describe --tags | sed 's/^v//'		
}

prepare() {
        cd wasm-component-ld
        export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
        cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

#check() {
#	cd wasm-component-ld
#	export RUSTUP_TOOLCHAIN=stable
#	export CARGO_TARGET_DIR=target
#	cargo test --locked --offline --all-features
#}


package() {
        cd wasm-component-ld
        export RUSTUP_TOOLCHAIN=stable
        cargo install --no-track --locked --offline --all-features --target-dir target --root "$pkgdir/usr/" --path .
}

