#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-engine-git
pkgver=rev.15447
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe"
arch=('i686' 'x86_64')
url="https://www.vega-strike.org"
license=('GPL-3.0-only')
depends=('boost-libs' 'python' 'freeglut' 'gtk3' 'libvorbis' 'openal' 'sdl2' 'glu')
#optdepends=('vegastrike-data: original dataset')
makedepends=('git' 'cmake' 'boost')
provides=('vegastrike-engine')
conflicts=('vegastrike-engine')
#install=$pkgname.install
#Options to make debugging easier
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Vega-Strike-Engine-Source'
#	'https://github.com/vegastrike/Vega-Strike-Engine-Source/pull/889.patch'
)
sha1sums=('SKIP'
#	'SKIP'
)

pkgver() {
  cd "${srcdir}"/Vega-Strike-Engine-Source
  echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
echo "Prepare section"
cd "${srcdir}"/Vega-Strike-Engine-Source
#git revert --no-commit 04f99ab64535fc0146a90ac9e226d71cbbac0095
#git revert -m 2 --no-commit 59deb3002e69a9f443d6d7ba1bb61c31f898fa7f
#git apply ../../889.patch
cd ..
pwd

mkdir -p build
#patch -Np1 -i ../mesh_tool_install.patch
}

build(){
#        export CC=gcc-12 CXX=g++-12
	cd build
	cmake ../Vega-Strike-Engine-Source/engine/ \
	-DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_GTEST=OFF \
        -DUSE_GTEST=OFF   \
	-DENABLE_PIE=ON 
	make
}

package() {
make -C build DESTDIR="${pkgdir}" install
rm -rf ${pkgdir}/usr/include
rm -rf ${pkgdir}/usr/lib
}
