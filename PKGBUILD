pkgname=magika

: "${_fragment:=tag=cli/v1.0.1}"

pkgver=1.0.1
pkgrel=2

pkgdesc='Fast and accurate AI powered file content types detection'
url="https://github.com/google/$pkgname"

arch=(x86_64 aarch64)
license=(Apache-2.0)

depends=(glibc gcc-libs)
makedepends=(git cargo)

source=("git+$url.git#$_fragment")
sha256sums=('cd9f9b926e94047e4e86095d2a6b43f43c4e0f68cd17c9edbf26f60444cda6b2')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's#^cli/v##; s/-/+/g'
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path "$pkgname/rust/cli/Cargo.toml"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --manifest-path "$pkgname/rust/cli/Cargo.toml"
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
	install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
