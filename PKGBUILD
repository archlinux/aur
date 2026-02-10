pkgname=bar_daemon
pkgver=0.4.7
pkgrel=1
pkgdesc="Async status bar daemon for Linux. Uses event-driven updating of values"
arch=('x86_64')
url="https://github.com/tmforshaw/bar_daemon"
license=('MIT')
depends=('wireplumber' 'brightnessctl' 'bluez' 'bluez-utils' 'acpi' 'asusctl' 'procps-ng')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94c3ff129bf3695ffd7886b4f6771c2c5020667161d88e30f51f0cb5dfc133a8')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	# Install the binary
	install -Dm755 target/release/bar_daemon "$pkgdir/usr/bin/bar_daemon"

	# Install the default config file
    install -d "$pkgdir/etc/bar_daemon"
    install -Dm644 default/config.toml "$pkgdir/etc/bar_daemon/config.toml"

    # Install the systemd user unit
    install -Dm644 packaging/bar_daemon.service "$pkgdir/usr/lib/systemd/user/bar_daemon.service"
}

post_install() {
	echo -e "\nEnable the service with:
	systemctl --user enable bar_daemon
	systemctl --user start bar_daemon"
}
