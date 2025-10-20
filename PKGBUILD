# Maintainer: Anna Schumaker <anna@nowheycreamery.com>
pkgname=emmental
pkgver=3.2.6
pkgrel=1
pkgdesc='The cheesy music player'
url='https://git.nowheycreamery.com/anna/emmental'
arch=('any')
license=('GPL3')
depends=(gstreamer gst-plugins-base gst-plugins-good gtk4 libadwaita python-dateutil python-gobject python-liblistenbrainz python-musicbrainzngs python-mutagen python-pyxdg xdg-user-dirs-gtk)
makedepends=(git desktop-file-utils)
optdepends=(gst-plugins-bad gst-plugins-ugly)
checkdepends=(flake8 python-flake8-docstrings python-pytest python-pytest-timeout python-pytest-subtests)
source=("https://git.nowheycreamery.com/anna/emmental/archive/emmental-$pkgver.tar.gz")
sha256sums=(7790ba9275fd8d791f8a514a26082af526b79310ca9bf580e549ed0bfb095ff9)

prepare() {
	cd $pkgname
	if [ ! -f "mpris-spec/Makefile" ]; then
		git clone https://gitlab.freedesktop.org/mpris/mpris-spec.git
	fi
}

build() {
	cd $pkgname
	make mpris2
	make emmental.gresource
}

package() {
	cd $pkgname
	make PREFIX="$pkgdir/usr" install
	sed -i "s|$pkgdir||" $pkgdir/usr/bin/emmental
	sed -i "s|$pkgdir||" $pkgdir/usr/share/applications/com.nowheycreamery.emmental.desktop
	rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
}

check() {
	cd $pkgname
	make tests
}
