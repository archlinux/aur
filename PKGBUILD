# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: shellkr <shellkr at protonmail dot com>
pkgname=systemd-manager-git
pkgver=1.0.0.r5.g946de58
pkgrel=1
pkgdesc="A systemd service manager written in Rust with the GTK-rs wrapper and direct integration with dbus"
arch=('i686' 'x86_64')
url="https://gitlab.com/mmstick/systemd-manager"
license=('MIT')
depends=('gtk3')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/mmstick/systemd-manager.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	#echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2) # 1.0.2
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's/gtk = { version = "0.1"/gtk = { version = "0.2.0"/g' Cargo.toml
	sed -i 's/gdk = { version = "0.5"/gdk = { version = "0.6"/g' Cargo.toml
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release --all-features
}

check() {
	cd "$srcdir/${pkgname%-git}"
	cargo test --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "target/release/${pkgname%-git}" "assets/${pkgname%-git}-pkexec" -t \
		"$pkgdir/usr/bin"
	install -Dm644 "assets/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "assets/org.freedesktop.policykit.${pkgname%-git}.policy" -t \
		"$pkgdir/usr/share/polkit-1/actions"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
