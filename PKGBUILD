# Maintainer: Marco Radocchia <marco.radocchia@outlook.com>
_pkgname="schoenerd"
pkgname="${_pkgname}-git"
pkgver="r18.91bffdb"
pkgrel=1
pkgdesc="Schoener's D index calculator for niche overlap."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/marcoradocchia/schoenerd"
license=('GPL3')
makedepends=('git' 'cargo')
checkdepends=('cargo')
provides=('schoenerd')
conflicts=('schoenerd')
source=("${_pkgname}::git+https://github.com/marcoradocchia/schoenerd.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	sed -i "s/^\(\s*\)version,/\1version = \"$pkgver\",/; s/v\({version}\)/\1/" ./src/cli.rs
	cargo build --frozen --release --all-features
}

# check() {
# 	cd "${_pkgname}"
# 	export RUSTUP_TOOLCHAIN=stable
# 	cargo test --frozen --all-features
# }

package() {
	cd "${_pkgname}"
	install -Dm755 "./target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

	install -Dm644 ./target/release/build/schoenerd-*/out/completions/_"${_pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 ./target/release/build/schoenerd-*/out/completions/"${_pkgname}".bash "$pkgdir/usr/share/bash-completion/completions/${_pkgname}.bash"
	install -Dm644 ./target/release/build/schoenerd-*/out/completions/"${_pkgname}".fish "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 ./target/release/build/schoenerd-*/out/man/"${_pkgname}".1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
