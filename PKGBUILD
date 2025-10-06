# Maintainer: Tobias Huttinger  <kontakt@tobiashuttinger.de>
# Contributor: Victor A. Santos  <victoraur.santos at gmail dot com>

pkgname=opensoundmeter-jack
pkgver=1.5.2
pkgrel=1
pkgdesc="Crossplatform measurement software for tuning sound systems with JACK support patched in"
arch=('x86' 'x86_64')
url="https://opensoundmeter.com"
license=('GPL-3.0-only')
depends=('alsa-lib' 'desktop-file-utils' 'qt5-base' 'qt5-declarative'
         'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-quickcontrols')
makedepends=('qt5-base')
provides=('opensoundmeter')
conflicts=('opensoundmeter')
source=("https://github.com/psmokotnin/osm/archive/refs/tags/v${pkgver}.tar.gz"
        "disable-appimage.patch"
		"osm-jack.patch")
md5sums=('1d025fe5ebf56c9a076fe177d9e28535'
         '010792657489e32e28d4f22205bde460'
		 '2762c3b37398429a3ee365a311736edb')

prepare() {
    cd "$srcdir/osm-${pkgver}"

    patch -N -i ../disable-appimage.patch
    patch -p1 -N -i ../osm-jack.patch
}

build() {
	cd "$srcdir/osm-${pkgver}"

	qmake-qt5 -o Makefile OpenSoundMeter.pro CONFIG+=jack
	make
}

package() {
	cd "$srcdir/osm-${pkgver}"

	install -Dm755 OpenSoundMeter "$pkgdir/usr/bin/OpenSoundMeter"
	install -Dm644 OpenSoundMeter.desktop "$pkgdir/usr/share/applications/OpenSoundMeter.desktop"
}
