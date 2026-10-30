# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux
pkgname="$_pkgbase"
pkgver=1.1.0
pkgrel=2
pkgdesc='Background file-sync daemon syncing local directories to multiple remotes'
arch=('x86_64' 'aarch64')
url='https://github.com/AperteDev/conflux'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
makedepends=('cargo' 'git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!lto')
backup=('etc/conflux/config.toml')
source=("$_pkgbase::git+$url.git#tag=v$pkgver")
sha256sums=('dfcdb23d452c46e4a8edcfa699185375fc90b5ba3817187238ba8f0d59c840e3')

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
	# The daemon's crates only: the GTK app is a package of its own.
	cargo test --frozen
}

package() {
	cd "$_pkgbase"
	install -Dm0755 "target/release/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
	install -Dm0644 config.example.toml "$pkgdir/etc/conflux/config.toml"
	install -Dm0644 systemd/conflux.user.service "$pkgdir/usr/lib/systemd/user/conflux.service"
	install -Dm0644 systemd/conflux@.user.service "$pkgdir/usr/lib/systemd/user/conflux@.service"
	install -Dm0644 systemd/conflux.system.service "$pkgdir/usr/lib/systemd/system/conflux.service"
	install -Dm0644 systemd/conflux@.system.service "$pkgdir/usr/lib/systemd/system/conflux@.service"
	# The system daemon's user, from 1.2.0 on. Then `make install-cli` installs all of this.
	if [ -f systemd/conflux.sysusers ]; then
		install -Dm0644 systemd/conflux.sysusers "$pkgdir/usr/lib/sysusers.d/conflux.conf"
	fi
	install -Dm0644 config.example.toml "$pkgdir/usr/share/doc/conflux/config.example.toml"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
