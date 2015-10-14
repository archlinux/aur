pkgbase=kdebindings-python-frameworks-git
pkgname=('kdebindings-python-frameworks-git'
         'kdebindings-python2-frameworks-git'
         'kdebindings-python-common-frameworks-git')
pkgver=r18.7679bd2
pkgrel=1
url='https://projects.kde.org/projects/kde/kdebindings/python/pykde5/repository'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kdebindings')
makedepends=('cmake' 'boost' 'python2-pyqt5' 'kio-pim'
             'python-pyqt5' 'qscintilla-qt5' 'python2-sip' 'python-sip' 'mesa')
source=("git+git://anongit.kde.org/pykde5")
sha1sums=('SKIP')

pkgver() {
  cd pykde5
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
  mkdir build-python2
  
  cd pykde5
}

build() {
  export PYTHONDONTWRITEBYTECODE="TRUE"

  cd build
  cmake ../pykde5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.5m.so.1.0 \
    -DPYKDEUIC4_ALTINSTALL=TRUE \
    -DWITH_Nepomuk=OFF \
    -DWITH_Soprano=OFF
  make -j4
  cd ..

  
  cd build-python2
  cmake ../pykde5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPYKDEUIC4_ALTINSTALL=TRUE \
    -DWITH_Nepomuk=OFF \
    -DWITH_Soprano=OFF
  make -j4
}

package_kdebindings-python-frameworks-git() {
  pkgdesc="A set of Python 3.x bindings for KDE"
  depends=('python-pyqt5' 'kdebindings-python-common-frameworks-git' 'kio-pim')

  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/share/sip"

}

package_kdebindings-python2-frameworks-git() {
  pkgdesc="A set of Python 2.x bindings for KDE"
  depends=('python2-pyqt5' 'kdebindings-python-common-frameworks-git' 'kio-pim')
  conflicts=('kdebindings-python<4.8.1-2')

  cd "${srcdir}"/build-python2
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/share/sip"

  find "${pkgdir}" -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
}

package_kdebindings-python-common-frameworks-git() {
  pkgdesc="Common files shared between python2 and python3 kdebindings"
  depends=('qscintilla-qt5')
  conflicts=('kdebindings-python')

  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/lib
}
