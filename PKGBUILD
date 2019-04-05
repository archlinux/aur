# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=apbs
pkgver=1.5
pkgrel=4
pkgdesc="Electrostatic and solvation properties for complex molecules"
arch=(x86_64 i686)
url="http://www.poissonboltzmann.org/"
license=('MIT')
depends=('swig' 'python2')
makedepends=('cmake' 'git' 'gcc')
source=("git+https://github.com/Electrostatics/apbs-pdb2pqr.git#commit=aa353941cfadc09ccd113075d261a427864c2979")
md5sums=('SKIP')

build() {
	cd ${srcdir}/apbs-pdb2pqr

    git submodule init
    git submodule update

    cd apbs

    cmake -Wno-dev -DCMAKE_EXE_LINKER_FLAGS="" -DCMAKE_MODULE_LINKER_FLAGS="" -DCMAKE_SHARED_LINKER_FLAGS="" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DPYTHON_LIBRARIES=/usr/lib/libpython2.7.so -DENABLE_PYTHON=ON -DBUILD_SHARED_LIBS=ON .
	make
}

package() {
	cd ${srcdir}/apbs-pdb2pqr/apbs

	make DESTDIR=$pkgdir install

    # fix python versions in scripts
    sed -i 's|/bin/python|/usr/bin/python2|g' ${pkgdir}/usr/share/apbs/examples/protein-rna/apbs_unix_dx.py
    sed -i 's|/usr/bin/env python|/usr/bin/python2|g' ${pkgdir}/usr/share/apbs/examples/protein-rna/fit.py
    sed -i 's|/usr/bin/env python|/usr/bin/python2|g' ${pkgdir}/usr/share/apbs/tools/manip/psize.py
    sed -i 's|/usr/bin/python|/usr/bin/python2|g' ${pkgdir}/usr/share/apbs/tools/python/noinput.py

    find "${pkgdir}/usr/share/apbs/tests" -name '*.py' -type f -exec \
       sed -i 's|/usr/bin/env python|/usr/bin/python2|g' {} \;
}
