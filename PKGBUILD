# Maintainer: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Brian Schubert <bewschubert@gmail.com>

_build_doc=ON
_build_apps=ON
pkgname=openmesh
pkgver=7.1
pkgrel=1
pkgdesc="A generic and efficient data structure for representing and manipulating polygonal meshes"
arch=('i686' 'x86_64')
url="http://www.openmesh.org"
license=('BSD')
depends=('mesa')
optdepends=('qt5-base: for using included applications')
source=("${pkgname}-${pkgver}.tar.bz2::http://www.openmesh.org/media/Releases/${pkgver}/OpenMesh-${pkgver}.tar.bz2"
    doc-install.patch)
sha256sums=('71cd5eb25893b0369ac766bb8305a525ffbb39b7f796d2878c7f9b8e0827cbac'
            '0ca0b0c4092d425615273e0e4ef57b91523b73d8c2bea6df96bc099f8596cb45')

if [[ "${_build_doc}" == "ON" && "${_build_apps}" == "ON" ]]; then
    makedepends=('cmake' 'qt4' 'graphviz' 'doxygen')
elif [[ "${_build_doc}" == "ON" ]]; then
    makedepends=('cmake' 'graphviz' 'doxygen')
elif [[ "${_build_apps}" == "ON" ]]; then
    makedepends=('cmake' 'qt4')
else
    makedepends=('cmake')
fi

prepare() {
  cd "${srcdir}/OpenMesh-${pkgver}"
    if [[ "${_build_doc}" == "ON" ]]; then
	patch -Np1 -i "${srcdir}"/doc-install.patch
    fi
}

build() {
    cd "${srcdir}/OpenMesh-${pkgver}"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_APPS=${_build_apps} \
	-DOPENMESH_PYTHON_VERSION=3.6 \
        ..
    make

    if [[ "${_build_doc}" == "ON" ]]; then
	make doc
    fi
}

package() {
    cd "${srcdir}"/OpenMesh-${pkgver}/build
    make DESTDIR="${pkgdir}" install
    
    # install licenses
    mkdir -p "${pkgdir}"/usr/share/licenses/openmesh/
    install -D -m644 ../LICENSE \
        "${pkgdir}"/usr/share/licenses/openmesh/
}
