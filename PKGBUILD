# Maintainer: KNOSSOS-Team <knossos-team ät mpimf-heidelberg.mpg.de>
# Contributor: Martin Drawitsch <mdraw.gh ät gmail.com>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIN/

pkgname=knossos
pkgver=5.1
pkgrel=5
arch=("x86_64")
pkgdesc="A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity."
url="https://knossos.app"
license=("GPL2")
depends=("glu"
	"qt5-base"
	"qt5-python27-git" # qt5-python27
	"qt5-tools" # Qt5Help
	"quazip"
	"snappy"
)
makedepends=("boost"
	"cmake"
	"ninja"
)
optdepends=("qt5-imageformats" # Jp2
)
source=("https://github.com/knossos-project/knossos/archive/v$pkgver.tar.gz"
	"knossos.desktop"
	"GCC8-combat-K5.patch"
	"https://raw.githubusercontent.com/knossos-project/knossos/f3bfcd80dc582248a59b857609a796d133bb1fa5/CMake/Modules/FindQuaZip.cmake"
	"https://github.com/knossos-project/knossos/commit/b6f40b52.patch"
)
md5sums=('fd97340a07b58b3f1b1543405d893c35'
         '1a2b3733cf5fcb3e1845ce771abb58e9'
         '9e6daa1198b3f819379995d37178e3d1'
         'b7f68f267e26f86db118cfafbb006ec9'
         '64544b58149bc2e0cd7be42944082310')

prepare() {
	cd "knossos-$pkgver"
	patch -p1 -i ../GCC8-combat-K5.patch
	cp -v ../FindQuaZip.cmake CMake/Modules
	patch -p 1 -i ../b6f40b52.patch
	sed 's/auto createGlobalAction/static auto createGlobalAction/' -i widgets/mainwindow.h
	sed 's/auto threeWaySorting/static auto threeWaySorting/' -i widgets/tools/model_helper.h
	sed 's/auto blockSelection/static auto blockSelection/' -i widgets/tools/model_helper.h
	sed 's/auto deltaBlockSelection/static auto deltaBlockSelection/' -i widgets/tools/model_helper.h
}

build() {
	mkdir -p "build-$CHOST-$pkgname-$pkgver"
	cd "build-$CHOST-$pkgname-$pkgver"
	cmake -G Ninja ../knossos-$pkgver
	cmake --build .
}

package() {
	install -Dm755 "build-$CHOST-$pkgname-$pkgver/knossos" "$pkgdir/usr/bin/knossos"
	install -Dm644 "knossos-$pkgver/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos.png"
	install -Dm644 "knossos.desktop" "$pkgdir/usr/share/applications/knossos.desktop"
}
