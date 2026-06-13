pkgname='kyanite-git'
pkgver=0.1.0
pkgrel=2
pkgdesc='A lightweight, graphical text editor'
arch=(any)
url='https://codeberg.org/pastthepixels/kyanite'
source=("git+$url.git")
license=('GPL-3.0-only')
makedepends=(
	# For building
	'rust'
	'clang'
	'git'
)
depends=(
	'libadwaita'
	'blueprint-compiler'
	'libpanel'
	'vte4'
	'gtksourceview5'
)
sha256sums=('SKIP')

pkgver() {
	sed -nr 's/^version \= "(.*)"/\1/p' kyanite/Cargo.toml
}

build() {
	cd kyanite
	cargo build --release
}

package() {
	# Install app
	install -Dm 0755 kyanite/target/release/ky "$pkgdir/usr/bin/ky"
	
	# Copy Application Icons
	install -Dm 0644 kyanite/resources/icons/ca.potatoe.Kyanite.svg "$pkgdir/usr/share/pixmaps/ca.potatoe.Kyanite.svg"
	install -Dm 0644 kyanite/resources/icons/ca.potatoe.Kyanite-symbolic.svg "$pkgdir/usr/share/pixmaps/ca.potatoe.Kyanite-symbolic.svg"
	
	# Copy Desktop Entry
	install -Dm 0644 kyanite/resources/metadata/ca.potatoe.Kyanite.desktop "$pkgdir/usr/share/applications/ca.potatoe.Kyanite.desktop"
	
	# Copy MIME Type Icons
	cd kyanite/resources/icons/builder-mimetypes
	find . ! -name "README.md" -type f -exec install -Dm 0644 "{}" "$pkgdir/usr/share/icons/hicolor/scalable/mimetypes/{}" \;
}

