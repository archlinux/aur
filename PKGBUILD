# Maintainer: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Brian Schubert <bewschubert@gmail.com>

_build_doc=OFF
_build_apps=ON
pkgname=openmesh
pkgver=8.1
pkgrel=1
pkgdesc="A generic and efficient data structure for representing and manipulating polygonal meshes"
arch=('i686' 'x86_64')
url="http://www.openmesh.org"
license=('BSD')
depends=('mesa')
optdepends=('qt5-base: for using included applications')
source=("${pkgname}-${pkgver}.tar.bz2::http://www.openmesh.org/media/Releases/${pkgver}/OpenMesh-${pkgver}.tar.bz2"
    doc-install.patch)

sha256sums=('9bc43a3201ba27ed63de66c4c09e23746272882c37a3451e71f0cf956f9be076'
            'cedf4ab2e6349caba7e899b5462643435bb42d7e70c6231e582f056ddf7bf41b')

if [[ "${_build_doc}" == "ON" && "${_build_apps}" == "ON" ]]; then
    makedepends=('cmake' 'qt5-base' 'graphviz' 'doxygen')
elif [[ "${_build_doc}" == "ON" ]]; then
    makedepends=('cmake' 'graphviz' 'doxygen')
elif [[ "${_build_apps}" == "ON" ]]; then
    makedepends=('cmake' 'qt5-base')
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
