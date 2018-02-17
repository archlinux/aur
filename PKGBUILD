# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: maz-1

pkgbase=kdebindings-python
pkgname=('kdebindings-python'
         'kdebindings-python2'
         'kdebindings-python-common')
_srcname=pykde4
pkgver=4.14.3
pkgrel=8
url='https://github.com/KDE/pykde4'
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
source=("https://github.com/KDE/${_srcname}/archive/v${pkgver}.tar.gz"
        "no-qtwebkit.patch"
        "no-webview.patch"
	"v4.14.3...master.patch"
	"fix-build-with-sip-4.19.patch"
	"pykde4-4.14.3-checkstate-sip-4.19.5.patch")

prepare() {
  mkdir -p build-python{,2}
  cd ${_srcname}-${pkgver}

  # Removes dependency on qtwebkit
  patch -p1 -i ${srcdir}/no-qtwebkit.patch

  # The arch version of kdelibs no longer provides kdewebkit
  # This patch is a crude attempt to get this to build without it
  patch -p1 -i ${srcdir}/no-webview.patch

  # A roundup of all the commits to master since the 4.14.3 release
  patch -p1 -i ${srcdir}/v4.14.3...master.patch

  # Build fixes for sip 4.19
  # First patch is from upstream. Second patch was taken from Fedora Rawhide
  # (fc28) src rpm
  patch -p1 -i ${srcdir}/fix-build-with-sip-4.19.patch
  patch -p1 -i ${srcdir}/pykde4-4.14.3-checkstate-sip-4.19.5.patch
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
md5sums=('c3b7624b56429988208d469f08d04250'
         'b20320e79db1a41d480ac47e47901586'
         '8f7f6da4bf4730003319d71382460775'
         'f35500d0b5e431954093d7f40968cb57'
         '1c06c9a4298dd109f9f1e46b94842df7'
         'f85154e3ea61c73e89c9bf57d33df56e')
