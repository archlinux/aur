pkgname="cairo-lang"
pkgver=2.2.0
release=""
pkgdesc="Cairo language installation"
pkgrel="1"
arch=("x86_64")
url="https://cairo-by-example.com/"
license=('APACHE')
depends=("git" "rustup")
source=("https://github.com/starkware-libs/cairo/archive/refs/tags/v2.2.0.tar.gz")
sha256sums=("147204fd038332f0a731c99788930eb3a8e042142965b0aa9543e93d532e08df")

prepare() {
	rustup override set stable
	rustup update
}

build() {
	cd "cairo-$pkgver$release"
	cargo build --all --release --manifest-path ./Cargo.toml
}

package() {
	mkdir -p $pkgdir/usr/bin/ $pkgdir/usr/lib/

	mv cairo-$pkgver$release/corelib/ $pkgdir/usr/lib/

	pkgs=("cairo-run" "cairo-compile" "cairo-format" "cairo-language-server" "cairo-test" "sierra-compile" "starknet-compile" "starknet-sierra-compile")

	for pkg in ${pkgs[@]}; do
		mv cairo-$pkgver$release/target/release/$pkg $pkgdir/usr/bin/
	done

	add_to_config
}

add_to_config() {
	declare -A shells=(["bash"]=".bashrc" ["fish"]=".config/fish/config.fish" ["zsh"]=".zshrc")

	echo "export CARGO_MANIFEST_DIR=\"/usr/bin/corelib/\"" >>/home/$USER/${shells[$(basename $(echo $SHELL))]}
}
