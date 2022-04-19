# Maintainer: KNOSSOS-Team <knossos-team ät mpimf-heidelberg.mpg.de>
# Contributor: Martin Drawitsch <mdraw.gh ät gmail.com>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIMF/

pkgname=knossos4
pkgver=4.1.2
pkgrel=13
arch=("x86_64")
pkgdesc="A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity."
url="https://knossos.app"
license=("GPL2")
depends=("curl"
	"glu"
	"glut"
	"qt5-python27-git" # qt5-python27
	"qt5-tools"
	"quazip"
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
	"GCC8-combat-K4.patch"
	"https://raw.githubusercontent.com/knossos-project/knossos/464cbb2b13f0142877e70a7d37528a92fe12b99e/CMake/Modules/FindQuaZip.cmake"
	"https://github.com/knossos-project/knossos/commit/f3bfcd80dc582248a59b857609a796d133bb1fa5.patch"
)
md5sums=('c648b510bcec05a914540eea7f577bfa'
         '07e9b7ac1ed5ecd0185ae92e61e97bbb'
         '67a3dfea8d64d8b9eb999f16096819ee'
         '10ac71de3331013293518da4be88cde6'
         '9e6daa1198b3f819379995d37178e3d1'
         'c901e39da0c394200d9f1bb81590d245'
         '34d98beaafbf2e6281402f881da5a8c7')

prepare() {
	cd "knossos-$pkgver"
	patch -p 1 -i ../curl.patch
	patch -p 1 -i ../qt-5.7.patch
	patch -p 1 -i ../GCC8-combat-K4.patch
	cp -v ../FindQuaZip.cmake cmake/Modules
	sed 's|CMake/Modules|cmake/Modules|' -i ../f3bfcd80dc582248a59b857609a796d133bb1fa5.patch
	sed 's|a/annotation/file_io.cpp|a/file_io.cpp|' -i ../f3bfcd80dc582248a59b857609a796d133bb1fa5.patch
	sed 's|quazip5/quazip|quazip/quazip|' -i ../f3bfcd80dc582248a59b857609a796d133bb1fa5.patch
	patch -p 1 -i ../f3bfcd80dc582248a59b857609a796d133bb1fa5.patch
	sed 's/snprintf(remoteURL, CSTRING_SIZE, url.toStdString().c_str());/snprintf(remoteURL, CSTRING_SIZE, "%s", url.toStdString().c_str());/' -i network.cpp
}

build() {
	mkdir -p "build-$CHOST-$pkgname-$pkgver"
	cd "build-$CHOST-$pkgname-$pkgver"
	cmake -G Ninja ../knossos-$pkgver
	cmake --build .
}

package() {
	install -Dm755 "build-$CHOST-$pkgname-$pkgver/knossos" "$pkgdir/usr/bin/knossos4"
	install -Dm644 "knossos-$pkgver/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos4.png"
	install -Dm644 "knossos4.desktop" "$pkgdir/usr/share/applications/knossos4.desktop"
}
