# Maintainer: James Appleton <james.appleton01@gmail.com>
pkgname="flaq"
pkgdesc="A simple CLI tool for modifying and querying metadata tags for \`.flac\` files."
pkgrel=2
pkgver="0.2.0"

makedepends=("git" "cargo" "jq")
depends=("glibc" "gcc-libs")
url="https://github.com/jmsapt/flaq"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
arch=("any")
license=("MIT")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	echo TODO
	# export RUSTUP_TOOLCHAIN=stable
	# cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

	# install completion scripts
	if [[ -d "$pkgdir/usr/share/bash-completion/completions" ]]; then
		echo "Installed bash autocompletions"
		install -Dm0755 -T "$pkgdir/usr/share/bash-completion/completions/$pkgname" "target/scripts/$pkgname.bash"
	else
		echo "Did not install bash autocompletions"
	fi

	# fish
	# ZSH_PATH="${pkgdir}/usr/local/share/fish"

	# fish TODO
	# if [[ -r /usr/share/bash-completion/bash_completion ]]; then
	#     install -Dm755 "./${pkgname}.bash" "${pkgdir}/usr/share/bash/completions/${pkgname}"
	# fi

	# elv TODO
	# if [[ -r /usr/share/bash-completion/bash_completion ]]; then
	#     install -Dm755 "./${pkgname}.bash" "${pkgdir}/usr/share/bash/completions/${pkgname}"
	# fi
}

# pkgver() {
# 	cd "${pkgname}"
# 	cargo metadata --format-version=1 --no-deps | jq ".packages[0].version"
# }
