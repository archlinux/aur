# Maintainer: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=0.8
pkgrel=2
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64')
url="https://gitlab.com/garuda-linux/applications/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'noto-fonts' 'polkit' 'btrfsmaintenance')
optdepends=('snapper')
makedepends=('git' 'cmake' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('91f0e37844e2a9e46a97aa0c6abc52692ec23f7dee37c4f84a787a970edec582')

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0644 snapper-snap-check.desktop $pkgdir/etc/xdg/autostart/snapper-snap-check.desktop
	install -Dm0644 org.garuda.btrfs-assistant.pkexec.policy $pkgdir/usr/share/polkit-1/actions/org.garuda.btrfs-assistant.pkexec.policy
}

