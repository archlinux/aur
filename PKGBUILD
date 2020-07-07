# Maintainer: Evert Vorster < evorster at gmail dot com >
#Contributor: Mike Roll <scaryspiderpig@gmail.com>

_pkgname=nvidia-texture-tools
pkgname="${_pkgname}-git"
pkgver=2.1.1.26a5641
pkgrel=1
pkgdesc="Texture processing tools with support for Direct3D 10 and 11 formats"
arch=('i686' 'x86_64')
url="https://github.com/castano/nvidia-texture-tools"
license=('MIT')
depends=('libpng' 'libjpeg' 'libtiff' 'openexr')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('cmake')
source=(git+https://github.com/castano/nvidia-texture-tools.git)
md5sums=('SKIP')

pkgver() {    
    cd "${srcdir}/${_pkgname}"
    echo "$(git tag | tail -1).$(git rev-parse --short HEAD)"
}

prepare(){
echo "Build section, I have to have it do something otherwise /n \
it complains about not having done anything, so here is an echo"
#
#Build error in master, rolling back to a good build.
#cd "${srcdir}"/nvidia-texture-tools/
#git reset --hard 1e0653901271b64c0803abb06ef9c46153831c8e
}


build() {
#configure first? Nah!
#   cd "${srcdir}/${_pkgname}"
#    ./configure --prefix=/usr --release

#cmake build
mkdir -p ${srcdir}/build
cd ${srcdir}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr  \
	-DCMAKE_C_FLAGS:STRING="${CFLAGS} -msse4.1" \
	-DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -msse4.1" \
 	../nvidia-texture-tools/
  make
}

package() {
    cd ${srcdir}/build/
    make DESTDIR=${pkgdir} install
}
