# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gpx-viewer
pkgver=0.5.0
pkgrel=2
pkgdesc="Simple tool to visualize tracks and waypoints stored in a gpx file"
arch=('x86_64')
url="https://blog.sarine.nl/tag/gpxviewer/"
license=('GPL')
depends=('gdl' 'libchamplain')
makedepends=('meson' 'vala' 'git')
source=("git+https://github.com/DaveDavenport/gpx-viewer#tag=$pkgver"
         format-security.patch)
sha256sums=('9003e388db2884ac66fcccc97e4b7b259b3203d8dd240531710ff2206314c0e7'
            'b50bdf5c28460a198a81bf9a836d78b5d1474dd9162c1ef5479454203a7beb87')

prepare() {
	cd $pkgname
	git cherry-pick -n c8664e489c7d3982420a505d2bebfbb3bfe8e250 # Fix build with libchamplain 0.12.21
	patch -p1 -i ../format-security.patch # Fix build with -Werror=format-security
}

build() {
	meson build $pkgname \
          --prefix=/usr
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
