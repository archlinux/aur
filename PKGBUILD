# Contributor: maz-1

pkgbase=kdebindings-python-git
pkgname=('kdebindings-python-git'
         'kdebindings-python2-git'
         'kdebindings-python-common-git'
         )
pkgver=r18.7679bd2
pkgrel=1
url='https://projects.kde.org/projects/kde/kdebindings/python/pykde5/repository'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kdebindings')
makedepends=('git'
             'extra-cmake-modules'
             'boost'
             'kplotting'
             'kitemmodels'
             'kguiaddons'
             'karchive'
             'kcoreaddons'
             'kitemviews'
             'sonnet'
             'kwidgetsaddons'
             'solid'
             'python-pyqt5'
             'python2-pyqt5'
             'python-sip'
             'python2-sip'
             )
source=('git+git://anongit.kde.org/pykde5')
sha1sums=('SKIP')

pkgver() {
  cd pykde5
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build-python{,2}
}

build() {
  export PYTHONDONTWRITEBYTECODE="TRUE"

  cd build-python
  cmake ../pykde5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DBUILD_TESTING=OFF
  make
  cd ..

  cd build-python2
  cmake ../pykde5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DBUILD_TESTING=OFF
  make
}

package_kdebindings-python-git() {
  pkgdesc="A set of Python 3.x bindings for KDE. (GIT Version)"
  depends=('python-pyqt5'
           'kdebindings-python-common-git'
           'kplotting'
           'kitemmodels'
           'kitemmodels'
           'kguiaddons'
           'karchive'
           'kcoreaddons'
           'kitemviews'
           'sonnet'
           'kwidgetsaddons'
           'solid'
           )
  conflicts=('kdebindings-python')
  provides=('kdebindings-python')

  make -C build-python DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/share"
}

package_kdebindings-python2-git() {
  pkgdesc="A set of Python 2.x bindings for KDE. (GIT Version)"
  depends=('python2-pyqt5'
           'kdebindings-python-common-git'
           'kplotting'
           'kitemmodels'
           'kguiaddons'
           'karchive'
           'kcoreaddons'
           'kitemviews'
           'sonnet'
           'kwidgetsaddons'
           'solid'
           )
#  conflicts=('kdebindings-python2')
  provides=('kdebindings-python2')

  make -C build-python2 DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/share"

  find "${pkgdir}" -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
}

package_kdebindings-python-common-git() {
  pkgdesc="Common files shared between python2 and python3 kdebindings. (GIT Version)"
#  conflicts=('kdebindings-python-common')
  provides=('kdebindings-python-common')

  make -C build-python DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/lib
}
