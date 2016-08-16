# Maintainer: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Brian Schubert <bewschubert@gmail.com>

_build_doc=ON
_build_apps=ON
pkgname=openmesh
pkgver=6.2
pkgrel=1
pkgdesc="A generic and efficient data structure for representing and manipulating polygonal meshes"
arch=('i686' 'x86_64')
url="http://www.openmesh.org"
license=('custom')
depends=('mesa')
optdepends=('qt4: for using included applications' )    
install=openmesh.install
source=("${pkgname}-${pkgver}.tar.bz2::http://www.openmesh.org/media/Releases/${pkgver}/OpenMesh-${pkgver}.tar.bz2"
    doc-install.patch)
md5sums=('6297105b2c6f74d21e1d6244fbf651ab'
         '451950dabec420fedd596fc740aa0c8f')

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
    if [[ "${_build_doc}" == "ON" ]]; then
	patch -Np0 -i doc-install.patch
    fi
}

build() {
    mkdir -p build
    cd build
    #cd "${srcdir}/OpenMesh-${pkgver}"
    cmake ../OpenMesh-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_APPS=${_build_apps} \
		-DOPENMESH_PYTHON_VERSION=3.5
    make

    if [[ "${_build_doc}" == "ON" ]]; then
	make doc
    fi
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    
    # install licenses
    mkdir -p "${pkgdir}"/usr/share/licenses/openmesh/
    install -D -m644 ../OpenMesh-${pkgver}/LICENSE \
        "${pkgdir}"/usr/share/licenses/openmesh/
	mv ${pkgdir}/usr/lib/python ${pkgdir}/usr/lib/python3.5
}
