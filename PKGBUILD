# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux
pkgname="$_pkgbase-git"
pkgver=1.0.0.r0.g2c7bd74
pkgrel=1
pkgdesc='Background file-sync daemon syncing local directories to multiple remotes'
arch=('x86_64' 'aarch64')
url='https://github.com/SelfRef/conflux'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
makedepends=('cargo' 'git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!lto')
backup=('etc/conflux/config.toml')
source=("$_pkgbase::git+https://github.com/SelfRef/conflux.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --bin conflux
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --workspace
}

package() {
	cd "$_pkgbase"
	install -Dm0755 "target/release/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
	install -Dm0644 config.example.toml "$pkgdir/etc/conflux/config.toml"
	install -Dm0644 systemd/conflux.user.service "$pkgdir/usr/lib/systemd/user/conflux.service"
	install -Dm0644 systemd/conflux@.user.service "$pkgdir/usr/lib/systemd/user/conflux@.service"
	install -Dm0644 systemd/conflux.system.service "$pkgdir/usr/lib/systemd/system/conflux.service"
	install -Dm0644 systemd/conflux@.system.service "$pkgdir/usr/lib/systemd/system/conflux@.service"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
