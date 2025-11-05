# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>

_pkgname=obs-vaapi
pkgname=obs-vaapi-git
pkgver=0.4.2.r8.g4e06e0c
pkgrel=1
pkgdesc="OBS Studio VAAPI support via GStreamer (git version)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fzwoch/obs-vaapi"
license=('GPL-2.0-only')
depends=('obs-studio' 'gst-plugins-base-libs' 'gstreamer-vaapi' 'gst-plugin-va')
makedepends=('git' 'meson')
conflicts=('obs-vaapi')
provides=('obs-vaapi')
source=("git+https://github.com/fzwoch/obs-vaapi.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	meson "$srcdir/$_pkgname" build --prefix=/usr --buildtype=release
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	# clean up after the new git design that tries to install to home directory
	# partially fixed by the --prefix=/usr above
	mkdir -p "$pkgdir/usr/lib/obs-plugins"
	mv "$pkgdir/usr/obs-vaapi.so" "$pkgdir/usr/lib/obs-plugins"
}
