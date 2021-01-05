# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pika-backup
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple backups based on borg"
arch=('x86_64')
url="https://gitlab.gnome.org/World/pika-backup"
license=('GPL')
depends=('borg' 'gtk3' 'libhandy' 'python-llfuse')
makedepends=('git' 'meson' 'rust')
_commit=bc490cf80e943c01dadf8a9171ff288863d64762 # tag=0.2.1
source=("git+https://gitlab.gnome.org/World/pika-backup.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$srcdir/$pkgname"

	# Remove single process limit
	sed -i '/codegen-units/d' Cargo.toml

	# Disable update-desktop-database & gtk-update-icon-cache
	sed -i '20,24d' data/meson.build
	sed -i '44,49d' data/meson.build
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
