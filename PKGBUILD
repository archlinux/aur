# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: shellkr <shellkr at protonmail dot com>
# Contributor: Adrian Pop <adrian dot pop sixtyone at gmail dot com>
pkgname=systemd-manager-git
pkgver=1.0.0.r12.g4efeb47
pkgrel=1
pkgdesc="A systemd service manager written in Rust with the GTK-rs wrapper and direct integration with dbus"
arch=('x86_64')
url="https://gitlab.com/adrianalin/systemd-manager"
license=('MIT')
depends=('gtk3')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/adrianalin/systemd-manager.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	#echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2) # 1.0.2
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release --all-features --target-dir=target
}

check() {
	cd "$srcdir/${pkgname%-git}"
	cargo test --release --target-dir=target
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
