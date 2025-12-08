# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=sftpman
epoch=1
pkgver=2.1.1
pkgrel=0
pkgdesc='A CLI application for managing and mounting sshfs (SFTP) filesystems'
url='https://github.com/spantaleev/sftpman-rs'
license=("AGPL-3.0-or-later")
makedepends=('git' 'cargo')
depends=('sshfs')
optdepends=('sftpman-iced: GUI frontend for sftpman v2+')
conflicts=('sftpman-python')
# Compiling on other architectures may work, but only the ones below have been tested and confirmed to work
arch=('x86_64' 'aarch64')
install=$pkgname.install
source=("git+https://github.com/spantaleev/sftpman-rs.git#tag=v$pkgver")
b2sums=('SKIP')

prepare() {
	cd "$srcdir/sftpman-rs"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/sftpman-rs"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$srcdir/sftpman-rs"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/sftpman-rs"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

	install -Dm 644 etc/bash_completion.d/sftpman "$pkgdir/usr/share/bash-completion/completions/sftpman"
	install -Dm 644 etc/fish-completions/sftpman.fish "$pkgdir/usr/share/fish/vendor_completions.d/sftpman.fish"
}
