# Maintainer: Snry Shell <snry@shell.dev>
# Release: tag as v<version> and push tag, then create GitHub release.
# The AUR publish workflow will update pkgver and publish automatically.
pkgname=snry-dm
pkgver=2.9.0
pkgrel=1
pkgdesc='Snry Shell Display Manager - Hyprland-based greeter and login screen'
arch=('x86_64')
url='https://github.com/sonroyaalmerol/snry-shell'
license=('MIT')
depends=(
	'snry-shell'
	'pam'
)
makedepends=('git' 'go' 'base-devel' 'pam')
optdepends=()
source=("git+https://github.com/sonroyaalmerol/snry-shell.git#tag=v$pkgver")
sha256sums=('SKIP')
backup=('etc/pam.d/snry-dm')
install=snry-dm.install

build() {
	cd "$srcdir/snry-shell"
	go build -o snry-dm ./cmd/snry-dm
}

package() {
	cd "$srcdir/snry-shell"

	# Install snry-dm binary
	install -Dm755 snry-dm "$pkgdir/usr/bin/snry-dm"

	# Install systemd system unit
	install -Dm644 configs/systemd/system/snry-dm.service "$pkgdir/usr/lib/systemd/system/snry-dm.service"

	# Install PAM config
	install -Dm644 configs/pam/snry-dm "$pkgdir/etc/pam.d/snry-dm"
}