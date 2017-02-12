# Maintainer: KNOSSOS-Team <knossos-team ät mpimf-heidelberg.mpg.de>
# Contributor: Martin Drawitsch <mdraw.gh ät gmail.com>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIMF/

pkgname=knossos4
pkgver=4.1.2
pkgrel=10
arch=('x86_64')
pkgdesc="A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity."
url="http://www.knossostool.org/"
license=("GPL2")
depends=("curl"
	"glu"
	"glut"
	"qt5-python27"
	"qt5-tools"
	"quazip-qt5"
	"snappy"
)
makedepends=("boost"
	"cmake"
	"libxmu" # CMake wants libxmu for GLUT
	"ninja"
)
source=("https://github.com/knossos-project/knossos/archive/v$pkgver.tar.gz"
	"curl.patch"
	"knossos4.desktop"
	"qt-5.7.patch"
	"quazip.patch"
)
md5sums=('c648b510bcec05a914540eea7f577bfa'
         '07e9b7ac1ed5ecd0185ae92e61e97bbb'
         '67a3dfea8d64d8b9eb999f16096819ee'
         '10ac71de3331013293518da4be88cde6'
         'be06cd6e91c80b63b9bfe4184b537d7e')

prepare() {
	cd "knossos-$pkgver"
	patch -p 1 -i ../curl.patch
	patch -p 1 -i ../quazip.patch
	patch -p 1 -i ../qt-5.7.patch
}

build() {
	mkdir -p "build-$CHOST-$pkgname-$pkgver"
	cd "build-$CHOST-$pkgname-$pkgver"
	cmake -G Ninja ../knossos-$pkgver
	ninja
}

package() {
	install -Dm755 "build-$CHOST-$pkgname-$pkgver/knossos" "$pkgdir/usr/bin/knossos4"
	install -Dm644 "knossos-$pkgver/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos4.png"
	install -Dm644 "knossos4.desktop" "$pkgdir/usr/share/applications/knossos4.desktop"
}
