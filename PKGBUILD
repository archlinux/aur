# Maintainer: Andrew Sun <adsun701@gmail.com>

_pypiname=pip
pkgbase=mingw-w64-python-pip
pkgname=('mingw-w64-python-pip')
pkgver=9.0.1
pkgrel=1
pkgdesc="An easy_install replacement for installing pypi python packages (mingw-w64)"
arch=(any)
url="https://pypi.python.org/pypi/pip"
license=('MIT')
makedepends=('mingw-w64-python-setuptools' 'fakeroot' 'lib32-fakeroot')
depends=('wine')
source=("https://github.com/pypa/${_pypiname}/archive/${pkgver}.tar.gz")
md5sums=('ae605ab1ccdcb7f9e219a400b4bc68b6')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  mkdir "${srcdir}/python3-build-i686-w64-mingw32"
  mkdir "${srcdir}/python3-build-x86_64-w64-mingw32"

  cp -R ${srcdir}/${_pypiname}-${pkgver}/. "${srcdir}/python3-build-i686-w64-mingw32"
  cp -R ${srcdir}/${_pypiname}-${pkgver}/. "${srcdir}/python3-build-x86_64-w64-mingw32"
}

build() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/python3-build-${_arch}"
    wine /usr/${_arch}/bin/python3.exe setup.py build
  done
}

package_mingw-w64-python-pip() {
  depends=('mingw-w64-python')
  optdepends=('mingw-w64-python-keyring: for pip.signatures')
  for _arch in ${_architectures}; do
    cd "${srcdir}/python3-build-${_arch}"
    /usr/${_arch}/bin/python3.exe setup.py install --root="$pkgdir/" --prefix=\usr/${_arch} --optimize=1

    # Remove conflicted files
    rm -f ${pkgdir}/usr/${_arch}/bin/pip{.exe,.exe.manifest,-script.py}
    install -D -m644 LICENSE.txt "${pkgdir}/usr/${_arch}/share/licenses/${pkgname}/LICENSE.txt"
  done
}
