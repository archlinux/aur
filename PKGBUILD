# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
pkgname=hepmc
_pkgname=HepMC3
pkgver=3.2.2
pkgrel=3
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators"
arch=('x86_64')
url="http://hepmc.web.cern.ch/"
license=('GPL2')
depends=('bash')
makedepends=('cmake' 'root' 'pythia8' 'python')
optdepends=('root: ROOT I/O'
            'pythia8: Pythia support'
            'python: Python interface')
source=("${pkgname}-${pkgver}.tar.gz::http://hepmc.web.cern.ch/${pkgname}/releases/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0e8cb4f78f804e38f7d29875db66f65e4c77896749d723548cc70fb7965e2d41')

build() {
    mkdir build
    cd build
    cmake "${srcdir}/${_pkgname}-${pkgver}" \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DHEPMC3_PYTHON_VERSIONS='3.X' \
      -DHEPMC3_ENABLE_TEST=ON \
      -DHEPMC3_BUILD_DOCS=ON \
      -DHEPMC3_BUILD_EXAMPLES=ON \
      -DHEPMC3_INSTALL_INTERFACES=ON \
      -Dmomentum=GEV -Dlength=MM
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    # fix CMake
    install -d "${pkgdir}/usr/lib/cmake"
    mv "${pkgdir}/usr/share/HepMC3/cmake" "${pkgdir}/usr/lib/cmake/${_pkgname}"
    sed -i 's@${CMAKE_CURRENT_LIST_DIR}/../../../@/usr@' \
      "${pkgdir}/usr/lib/cmake/${_pkgname}/${_pkgname}Config.cmake"
}
