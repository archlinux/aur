# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: maz-1

pkgbase=kdebindings-python
pkgname=('kdebindings-python'
         'kdebindings-python2'
         'kdebindings-python-common')
_srcname=pykde4
pkgver=4.14.2
pkgrel=1
url='https://projects.kde.org/projects/kde/kdebindings/python/pykde4/repository'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
makedepends=('automoc4'
             'boost'
             'cmake'
             'kdepimlibs4'
             'python-pyqt4'
             'python2-pyqt4'
             'python-sip'
             'python2-sip'
             'qscintilla')
source=("https://download.kde.org/Attic/stable/${pkgver}/src/${_srcname}-${pkgver}.tar.xz"
        "no-qtwebkit.patch"
        "no-webview.patch")

prepare() {
  mkdir -p build-python{,2}
  cd ${_srcname}-${pkgver}

  # Removes dependency on qtwebkit
  patch -p1 -i ${srcdir}/no-qtwebkit.patch

  # The arch version of kdelibs no longer provides kdewebkit
  # This patch is a crude attempt to get this to build without it
  patch -p1 -i ${srcdir}/no-webview.patch
}

build() {
  export PYTHONDONTWRITEBYTECODE="TRUE"

  cd build-python
  cmake ../${_srcname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DBUILD_TESTING=OFF
  make
  cd ..

  cd build-python2
  cmake ../${_srcname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DBUILD_TESTING=OFF
  make
}

package_kdebindings-python() {
  pkgdesc="A set of Python 3.x bindings for KDE."
  depends=('kdebindings-python-common'
           'kdepimlibs4'
           'python-pyqt4')

  make -C build-python DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/share"
}

package_kdebindings-python2() {
  pkgdesc="A set of Python 2.x bindings for KDE."
  depends=('kdebindings-python-common'
           'kdepimlibs4'
           'python2-pyqt4')

  make -C build-python2 DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/share" "${pkgdir}/usr/bin/pykdeuic4"

  find "${pkgdir}" -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
}

package_kdebindings-python-common() {
  pkgdesc="Common files shared between python2 and python3 kdebindings."

  make -C build-python DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
}
md5sums=('b34e92677ffc8c74220d4c32a89ec57d'
         'b20320e79db1a41d480ac47e47901586'
         '8f7f6da4bf4730003319d71382460775')
