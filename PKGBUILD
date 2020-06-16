#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-git
pkgver=rev.13926
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe"
arch=('i686' 'x86_64')
url="www.vega-strike.org"
license=('GPL')
depends=('boost-libs' 'python' 'freeglut' 'gtk2' 'openal' 'sdl' 'glu' 'vegastrike-data')
#optdepends=('vegastrike-data: original dataset')
makedepends=('git' 'cmake')
provides=('vegastrike')
conflicts=('vegastrike')
#install=$pkgname.install
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Vega-Strike-Engine-Source')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/Vega-Strike-Engine-Source
  echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
mkdir -p build
patch -Np1 -i ../python3_compile.patch
}

build(){
	cd build
	cmake ../Vega-Strike-Engine-Source/engine/ \
	-DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DENABLE_PIE=ON \
	-DUSE_PYTHON_3=ON 
	make
}

package() {
mkdir -p "${pkgdir}"/usr/bin
  cd build
  cp -vp {vegastrike,setup/vegasettings,objconv/mesh_tool} "${pkgdir}"/usr/bin
}
