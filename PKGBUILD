# Maintainer: Xiang Gao <qasdfgtyuiop@gmail.com>
# Contributor: Samo Turk <samo.turk@gmail.com> 
pkgname=python-rdkit-git
pkgver=20180107
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("x86_64")
url="http://rdkit.org/"
license=('New BSD License')
depends=( 'bison' 'boost' 'boost-libs' 'cmake' 'flex' 'python' 'sqlite3' 'python-numpy' 'python-cairocffi' 'python-pillow')
makedepends=('git')
source=("http://www.inchi-trust.org/download/104/INCHI-1-API.zip"
        "git+https://github.com/rdkit/rdkit.git")
md5sums=('8447bf108af12fe66eecba41bbc89918' 'SKIP')
provides=('rdkit')

pkgver() {
  cd ${srcdir}/rdkit
  git log -1 --format=%cd --date=short | sed 's/-//g'
}

build() {
  cd ${srcdir}
  cp INCHI-1-API/INCHI_API/inchi_dll/* rdkit/External/INCHI-API/
  cmake rdkit \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=0 \
    -DRDK_BUILD_THREADSAFE_SSS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/libpython3.6m.a \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m/ \
    -DPYTHON_EXECUTABLE=/usr/bin/python
  make -j$(nproc)
}


package() {
  echo "Making package.."
  cd ${srcdir}
  make DESTDIR=${pkgdir} install 
}
