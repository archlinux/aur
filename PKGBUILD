# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=natron
pkgver=2.1.8
pkgrel=1
pkgdesc="Open source compositing software. Node-graph based. Similar in functionalities to Adobe After Effects and Nuke by The Foundry."
arch=("i686" "x86_64")
url="http://natron.fr/"
license=("GPL")
depends=('fontconfig' 'qt4' 'python2-pyside' 'python2-shiboken' 'boost-libs' 'pixman' 'glfw-x11' 'cairo' 'openfx-io' 'openfx-misc')
makedepends=('git' 'expat' 'boost')
optdepends=('openfx-arena: Extra OpenFX plugins for Natron includes text node')
source=("$pkgname::git://github.com/MrKepzie/Natron.git#tag=$pkgver"
	"https://github.com/MrKepzie/OpenColorIO-Configs/archive/Natron-v${pkgver%.*}.tar.gz"
	"config.pri")
md5sums=('SKIP'
         '4ca4eca4856cae50cfa4645a090258dd'
         '09f5ac67c0ad57eb853141b38eccb0ff')

prepare() {
	cd "$srcdir/$pkgname"

	mv "$srcdir/OpenColorIO-Configs-Natron-v${pkgver%.*}" "$srcdir/$pkgname/OpenColorIO-Configs"

	# For OpenFX update
	git submodule update -i --recursive

	mv "${srcdir}/config.pri" "${srcdir}/${pkgname%%-*}/config.pri"

	# Fix for gcc6 build issues
	sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Gui/Gui.pro
	sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Engine/Engine.pro
	sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Tests/Tests.pro
}

build() {
	cd "$srcdir/$pkgname"

	[[ -d build ]] && rm -r build; mkdir build; cd build

	qmake-qt4 -r "$srcdir/natron/Project.pro" PREFIX=/usr CONFIG+=release DEFINES+=QT_NO_DEBUG_OUTPUT \
	QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"

	make
}

package() {
	cd "$srcdir/$pkgname/build"

	make INSTALL_ROOT="$pkgdir" install
}
