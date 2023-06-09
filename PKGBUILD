# Maintainer: Anna Schumaker <anna@nowheycreamery.com>
pkgname=emmental
pkgver=3.0.2
pkgrel=2
pkgdesc='The cheesy music player'
url='https://www.git.nowheycreamery.com/anna/emmental'
arch=('any')
license=('GPL3')
depends=(gstreamer gst-plugins-base gtk4 libadwaita python-dateutil python-gobject python-musicbrainzngs python-mutagen python-pyxdg xdg-user-dirs-gtk)
makedepends=(git desktop-file-utils)
optdepends=(gst-plugins-good gst-plugins-bad gst-plugins-ugly)
checkdepends=(flake8 python-pytest python-pytest-timeout python-pytest-subtests)
source=("https://git.nowheycreamery.com/anna/emmental/archive/emmental-$pkgver.tar.gz")
sha256sums=(c73c1e60df3f2b01a361fe52ed623af20465eb6435454ac3a982dba9cc56dfa9)

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
