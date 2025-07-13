# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Options
options=('!strip' '!debug')

# Maintainer: Vaibhav Mattoo <vaibhavmattoo1@gmail.com>
pkgname=alman
pkgver=0.1.2
pkgrel=1
pkgdesc="Intelligent alias manager with TUI for managing shell aliases with intelligent suggestions based on command history"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/vaibhav-mattoo/alman"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
optdepends=(
    'bash: For bash shell integration'
    'zsh: For zsh shell integration'
    'fish: For fish shell integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vaibhav-mattoo/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CARGO_PROFILE_RELEASE_LTO=true
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	# Install man page if it exists
	if [ -f "man/man1/$pkgname.1" ]; then
		install -Dm 644 "man/man1/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	fi
	
	# Install shell integration files
	install -Dm 644 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
	install -Dm 644 uninstall.sh "$pkgdir/usr/share/$pkgname/uninstall.sh"
}

post_install() {
	echo
	echo "=========================================="
	echo "alman has been installed successfully!"
	echo
	echo "To enable alman in your shell, add one of these lines to your shell config:"
	echo "  Bash: eval \"\$(alman init bash)\" (add to ~/.bashrc)"
	echo "  Zsh:  eval \"\$(alman init zsh)\"  (add to ~/.zshrc)"
	echo "  Fish: alman init fish | source      (add to ~/.config/fish/config.fish)"
	echo
	echo "Then reload your shell configuration or restart your terminal."
	echo "=========================================="
	echo
}
