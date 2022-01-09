# Maintainer: Andrew Sun <adsun701@gmail.com>

_pypiname=setuptools
pkgbase=mingw-w64-python-setuptools
pkgname=('mingw-w64-python-setuptools')
pkgver=36.7.2
pkgrel=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages (mingw-w64)"
arch=(any)
url="https://pypi.python.org/pypi/setuptools"
license=('MIT')
makedepends=('mingw-w64-python-pip' 'fakeroot' 'lib32-fakeroot')
depends=('wine')
source=("https://github.com/pypa/setuptools/archive/v${pkgver}.tar.gz"
  '0001-mingw-python-fix.patch'
  '0002-Allow-usr-bin-env-in-script.patch'
  '0003-MinGW-w64-Look-in-same-dir-as-script-for-exe.patch'
  '0004-dont-execute-msvc.patch')
md5sums=('5c76d4500cecfc2ba2465a42daad5099'
  '9a47748aa98d1263b4b056f0c46b11b1'
  'c89605bb93f8e6ab683ec8e3ca2ff9df'
  '12685e2e10a64e7b0615098d4b0a1c41'
  '41da2b739443e65a72f9bb4ae454eb57')
_py3_base=3.6

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/setuptools-${pkgver}"
  patch -p1 -i ${srcdir}/0001-mingw-python-fix.patch
  patch -p1 -i ${srcdir}/0002-Allow-usr-bin-env-in-script.patch
  patch -p1 -i ${srcdir}/0003-MinGW-w64-Look-in-same-dir-as-script-for-exe.patch
  patch -p1 -i ${srcdir}/0004-dont-execute-msvc.patch

  cd "${srcdir}"

  i686-w64-mingw32-gcc -DGUI=0 -O -s -o setuptools-${pkgver}/setuptools/cli-32.exe setuptools-${pkgver}/launcher.c
  i686-w64-mingw32-gcc -DGUI=1 -mwindows -O -s -o setuptools-${pkgver}/setuptools/gui-32.exe setuptools-${pkgver}/launcher.c
  x86_64-w64-mingw32-gcc -DGUI=0 -O -s -o setuptools-${pkgver}/setuptools/cli-64.exe setuptools-${pkgver}/launcher.c
  x86_64-w64-mingw32-gcc -DGUI=1 -mwindows -O -s -o setuptools-${pkgver}/setuptools/gui-64.exe setuptools-${pkgver}/launcher.c

  for _arch in ${_architectures}; do
    cp -r "${srcdir}/setuptools-${pkgver}" ${srcdir}/setuptools-python3-${_arch}

    cd "${srcdir}"/setuptools-python3-${_arch}
    sed -i -e "s|^#\!.*/usr/bin/python|#!/usr/bin/python3|" tests/manual_test.py
    sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env python3|" setuptools/command/easy_install.py

  done
}

build() {
  for _arch in ${_architectures}; do
    # Build python 3 module
    cd "${srcdir}"/setuptools-python3-${_arch}
    /usr/${_arch}/bin/python3.exe bootstrap.py
    /usr/${_arch}/bin/python3.exe setup.py build
  done
}

package_mingw-w64-python-setuptools() {
  depends=("mingw-w64-python>=3.3")
  for _arch in ${_architectures}; do

    cd "${srcdir}/setuptools-python3-${_arch}"
    /usr/${_arch}/bin/python3.exe setup.py install --prefix="\usr/${_arch}" --root="${pkgdir}" --optimize=1 --skip-build

    # Move files conflicted with python2-setuptools
    mv ${pkgdir}/usr/${_arch}/bin/easy_install-script.py ${pkgdir}/usr/${_arch}/bin/easy_install-${_py3_base}-script.py
    mv ${pkgdir}/usr/${_arch}/bin/easy_install.exe ${pkgdir}/usr/${_arch}/bin/easy_install-${_py3_base}.exe

  done

  [[ -f ${pkgdir}/usr/i686-w64-mingw32/bin/easy_install.exe.manifest ]] && {
    mv ${pkgdir}/usr/i686-w64-mingw32/bin/easy_install.exe.manifest ${pkgdir}/usr/i686-w64-mingw32/bin/easy_install-${_py3_base}.exe.manifest
    sed -e "s|easy_install|easy_install-${_py3_base}|g" -i ${pkgdir}/usr/i686-w64-mingw32/bin/easy_install-${_py3_base}.exe.manifest
  }

}
