# Maintainer: Andrew-Velox <mohabbat.bd2020@gmail.com>
#
# Builds from the latest commit on main. Publish it to the AUR as
# `animfetch-git`. Unlike `animfetch-bin` this needs no release to exist first,
# so it is the one to put up while there are no tags yet.

pkgname=animfetch-git
_pkgname=animfetch
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Animated system fetch that stays pinned above your shell while you work'
arch=('x86_64' 'aarch64')
url='https://github.com/Andrew-Velox/animfetch'
license=('MIT')
# A native build links the system C runtime, unlike the static musl binaries the
# release workflow produces. namcap on the built package is what catches these.
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	# Anchored on `version`, so the `rust-version` and `name` lines beside it in
	# the manifest cannot be picked up instead.
	printf '%s.r%s.g%s' \
		"$(sed -n 's/^version *= *"\([^"]*\)".*/\1/p' Cargo.toml | head -1)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release
}

package() {
	cd "$_pkgname"
	install -Dm755 target/release/"$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 config.example.toml \
		"$pkgdir/usr/share/$_pkgname/config.example.toml"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"

	# MIT carries a copyright line, so Arch wants the text installed.
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
