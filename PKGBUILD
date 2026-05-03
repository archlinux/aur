# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>
# Contributor: syntheit <daniel@matv.io>

_pkgname=rigsofrods
_gitname=rigs-of-rods
_depsver=2baee9c21dcd67655bf2f86d4c9f3bd6715f05da

pkgname=rigsofrods
pkgver=2026.01
pkgrel=1
pkgdesc="An open source vehicle simulator based on soft-body physics"
arch=('i686' 'x86_64')
url="https://rigsofrods.org"
license=('GPL')
depends=('curl'
         #'angelscript'
         'fmt'
         'freeimage'
         'freetype2'
         'ois'
         'nvidia-cg-toolkit'
         'openal'
         'rapidjson'
         #'socketw' broken at the moment
         'zlib'
         'zziplib')
makedepends=('gcc' 'cmake' 'python')
conflicts=('rigsofrods-git' 'rigsofrods-hg' 'rigsofrods-bin')
options=('!debug')
source=("https://github.com/RigsOfRods/rigs-of-rods/archive/${pkgver}.tar.gz"
    "https://github.com/RigsOfRods/ror-dependencies/archive/${_depsver}.tar.gz"
	"plugins.cfg"
	"rigsofrods.png"
	"RoR.desktop"
	"FindOIS.cmake"
	"install.cmake")
sha256sums=('e191ac878d905d898c82bc3610ee811a9bc63db76f883a2bf294b74ea3767c81'
            'c2a78d1338e8b4c305d358e75d99ee0e285621c66304a4f7ede58b360df25ec4'
            '25b5c06eb3249b23b2595f57d5305ab1b18301a651d4836bb3a12e2bb55e31d9'
            'aef6a25da69bc8b5b06160d402a612255a3ba0f653115873a3f7eb7b33964c73'
            '6644cdc33ed48cd5d70154e6b87b97b47e6cdc5b3c6eb8d2b0c7cd9ef797b665'
            'c9b6258830bf7caed2262df099722af80528205af5f9099aa297bbc8e4425d4b'
            '46804f8965963c93144c6d1636f52d00b89e999b6595319c0d3653cbb8dd207b')
build() {
    # Build deps first
    cd "$srcdir/ror-dependencies-$_depsver"
    cmake . -DCMAKE_BUILD_TYPE=Release \
            -DBUILD_ANGELSCRIPT=ON \
            -DBUILD_CAELUM=ON \
            -DBUILD_CURL=OFF \
            -DBUILD_FMT=OFF \
            -DBUILD_MYGUI=ON \
            -DBUILD_OGRE=ON \
            -DBUILD_OIS=OFF \
            -DBUILD_OPENAL=OFF \
            -DBUILD_PAGEDGEOMETRY=ON \
            -DBUILD_RAPIDJSON=OFF \
            -DBUILD_SOCKETW=ON
    make

    cd "$srcdir/$_gitname-$pkgver"

    cp "../FindOIS.cmake" "cmake/find-modules/FindOIS.cmake"

    # get a clean build dir
    [[ -d build ]] && rm -rf build

    export CFLAGS=${CFLAGS/-Werror=format-security/}
    export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

    cmake . -DCMAKE_BUILD_TYPE=Release \
        -Bbuild \
        -DROR_BUILD_DEV_VERSION=OFF \
        -DROR_CUSTOM_VERSION="$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/opt/rigsofrods/ \
        -DROR_DEPENDENCY_DIR="$srcdir/ror-dependencies-$_depsver/Dependencies_Linux/"

    cd build
    make
}

package() {
    cd "$srcdir/$_gitname-$pkgver/build"

    DESTDIR="$pkgdir" make install

    cd "$srcdir"

    # Copy over ogre libraries
    cmake -Dsrcdir="$srcdir/ror-dependencies-$_depsver/Dependencies_Linux/lib" -Dpkgdir="$pkgdir" -P "$srcdir/install.cmake"

    install -Dm755 rigsofrods.png "$pkgdir/usr/share/pixmaps/rigsofrods.png"
    install -Dm755 RoR.desktop "$pkgdir/usr/share/applications/RoR.desktop"
    install -Dm755 plugins.cfg "$pkgdir/opt/$_pkgname/plugins.cfg"
}