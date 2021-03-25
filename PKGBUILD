# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pika-backup
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple backups based on borg"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/pika-backup"
license=('GPL')
depends=('borg' 'gtk3' 'libhandy' 'python-llfuse')
makedepends=('git' 'meson' 'rust')
_commit=3335333b974b573765e5ed170bd9a4248a2732e2 # tag=v0.2.2
source=("git+https://gitlab.gnome.org/World/pika-backup.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$srcdir/$pkgname"

	# Remove single process limit
#	sed -i '/codegen-units/d' Cargo.toml

	# Disable update-desktop-database & gtk-update-icon-cache
	sed -i '20,24d' data/meson.build
	sed -i '44,49d' data/meson.build
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
