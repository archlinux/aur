# Maintainer: Jaeho Cho <jaeho2025@gmail.com>
pkgname=asst-git
_pkgname=asst
pkgver=0.1.0
pkgrel=1
pkgdesc="Tasks and reminders on a CalDAV server (Nextcloud): daemon, CLI, GTK window, quick add, waybar module"
arch=('x86_64')
url="https://github.com/jaehho/asst"
license=('MIT')
depends=('dbus' 'gcc-libs' 'glibc' 'gtk4' 'libadwaita' 'gtk4-layer-shell')
makedepends=('git' 'rustup')
optdepends=('gnome-keyring: or another Secret Service provider, to hold the app password'
            'waybar: for `asst bar`')
provides=('asst')
conflicts=('asst')
options=('!lto' '!debug')
source=("git+https://github.com/jaehho/asst.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	local desc
	if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
	cargo build --release --locked --workspace
}

check() {
	cd "$_pkgname"
	cargo test --release --locked --workspace
}

package() {
	cd "$_pkgname"
	install -Dm755 target/release/asst "$pkgdir/usr/bin/asst"
	install -Dm755 target/release/asstd "$pkgdir/usr/bin/asstd"
	install -Dm755 target/release/asst-gtk "$pkgdir/usr/bin/asst-gtk"
	install -Dm644 packaging/dev.jaeho.Asst.desktop "$pkgdir/usr/share/applications/dev.jaeho.Asst.desktop"
	install -Dm644 packaging/icons/dev.jaeho.Asst.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.jaeho.Asst.svg"
	install -Dm644 packaging/asstd.service "$pkgdir/usr/lib/systemd/user/asstd.service"
	install -Dm644 packaging/dev.jaeho.Asst.Daemon.service "$pkgdir/usr/share/dbus-1/services/dev.jaeho.Asst.Daemon.service"
	install -Dm644 packaging/dev.jaeho.Asst.service "$pkgdir/usr/share/dbus-1/services/dev.jaeho.Asst.service"
	install -Dm644 nvim/plugin/asst.lua "$pkgdir/usr/share/asst/nvim/plugin/asst.lua"
	install -Dm644 nvim/lua/asst.lua "$pkgdir/usr/share/asst/nvim/lua/asst.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
