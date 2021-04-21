# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>

pkgbase=hepmc
pkgname=("${pkgbase}" "${pkgbase}-docs")
_pkgname=HepMC3
pkgver=3.2.3
pkgrel=2
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators"
arch=('x86_64')
url="http://hepmc.web.cern.ch/"
license=('GPL3')
depends=('bash')
makedepends=('cmake' 'doxygen' 'hepmc2' 'gcc-fortran' 'graphviz' 'root' 'pythia8' 'python')
optdepends=('root: ROOT I/O'
            'pythia8: Pythia support'
            'python: Python interface')
source=("${pkgbase}-${pkgver}.tar.gz::http://hepmc.web.cern.ch/${pkgbase}/releases/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8caadacc2c969883cd1f994b622795fc885fb4b15dad8c8ae64bcbdbf0cbd47d')

build() {
    mkdir build
    cd build
    PYTHIA8_ROOT_DIR=/usr \
    cmake "${srcdir}/${_pkgname}-${pkgver}" \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DHEPMC3_PYTHON_VERSIONS='3.X' \
      -DHEPMC3_ENABLE_TEST=ON \
      -DHEPMC3_BUILD_DOCS=ON \
      -DHEPMC3_BUILD_EXAMPLES=ON \
      -DHEPMC3_INSTALL_INTERFACES=ON \
      -DUSE_INTERFACE_FROM_PYTHIA8=ON \
      -DPYTHIA8_XMLDOC_DIR=/usr/share/pythia8/xmldoc
    make
}

package_hepmc() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    # fix CMake
    install -d "${pkgdir}/usr/lib/cmake"
    mv "${pkgdir}/usr/share/HepMC3/cmake" "${pkgdir}/usr/lib/cmake/${_pkgname}"
    sed -i 's@${CMAKE_CURRENT_LIST_DIR}/../../../@/usr@' \
      "${pkgdir}/usr/lib/cmake/${_pkgname}/${_pkgname}Config.cmake"
    # drop docs
    rm -rf "${pkgdir}"/usr/share/doc
}

package_hepmc-docs() {
    depends=()
    pkgdesc="A particle physics package for storing collision events from Monte Carlo generators (Documentation)"
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    # fix CMake
    install -d "${pkgdir}/usr/lib/cmake"
    mv "${pkgdir}/usr/share/HepMC3/cmake" "${pkgdir}/usr/lib/cmake/${_pkgname}"
    sed -i 's@${CMAKE_CURRENT_LIST_DIR}/../../../@/usr@' \
      "${pkgdir}/usr/lib/cmake/${_pkgname}/${_pkgname}Config.cmake"
    # drop everything, but docs
    rm -rf "${pkgdir}"/usr/bin
    rm -rf "${pkgdir}"/usr/include
    rm -rf "${pkgdir}"/usr/lib
    rm -rf "${pkgdir}"/usr/share/HepMC3
}
