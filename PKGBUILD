pkgname="cairo-lang"
pkgver=2.0.0
release="rc4"
pkgrel=1
epoch=
pkgdesc="Cairo language installation"
arch=("x86_64")
url="https://cairo-by-example.com/"
license=('MIT')
groups=()
depends=("git" "rustup")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/starkware-libs/cairo/archive/refs/tags/v$pkgver-$release.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()
sha256sums=("e3dd3ce3f9ab5b69c44d01b13777d92516dcd830efb6a3d2cd46915d4f03e8a9")
prepare() {
	rustup override set stable
	rustup update
}

build() {
	cd "cairo-$pkgver-$release"
	cargo build --all --release --manifest-path ./Cargo.toml
	
}

package() {
	mkdir -p $pkgdir/usr/bin/ $pkgdir/usr/lib/

	mv cairo-$pkgver-$release/corelib/ $pkgdir/usr/lib/
	
	pkgs=("cairo-run" "cairo-compile" "cairo-format" "cairo-language-server" "cairo-test" "sierra-compile" "starknet-compile" "starknet-sierra-compile")
	
	for pkg in ${pkgs[@]}; do
		mv cairo-$pkgver-$release/target/release/$pkg $pkgdir/usr/bin/
	done
	
	add_to_config
}

add_to_config() {
	declare -A shells=( ["bash"]=".bashrc" ["fish"]=".config/fish/config.fish" ["zsh"]=".zshrc")

	echo "export CARGO_MANIFEST_DIR=\"/usr/bin/corelib/\"" >> /home/$USER/${shells[$(basename $(echo $SHELL))]}
}
