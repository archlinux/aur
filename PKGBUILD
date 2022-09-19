# Maintainer: Robert Falkenberg <falkenber9@gmail.com>

pkgname=python-pysim-git
_pyname=${pkgname#python-}
_pyname=${_pyname%-git}
pkgver=1.0.r442.g4e64e727
pkgrel=1
pkgdesc='A python tool to program SIMs / USIMs / ISIMs'
arch=('any')
url='https://osmocom.org/projects/pysim/wiki'
license=('GPL2')
depends=('python'
         'python-bidict'
         'python-cmd2>=1.3.0'
         'python-colorlog'
         'python-construct>=2.9'
         'python-gsm0338'
         'python-jsonpath-ng'
         'python-pyscard'
         'python-pyserial'
         'python-pytlv'
         'python-termcolor'
         'python-yaml>=5.1')
makedepends=('python-setuptools' 'git')
provides=('python-pysim')
source=('git+https://git.osmocom.org/pysim'
        '0001-pySim-shell.py-make-it-work-with-cmd2-v2.0.0.patch'
        '0002-pySim-shell.py-make-it-work-with-cmd2-v2.4.0.patch')
sha256sums=('SKIP'
            '2eb84bfbd29c8cda42b53d5523e71be8beada766b1fd4970d3ce527852797716'
            'b9daf3e3ec027731afeecba8b0d501963944403e6d770a127d35f70c1bacf97c')

pkgver() {
  cd ${_pyname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^\(v\)\1*//'
}

prepare() {
  # apply patches for compatibility with newer cmd2 versions
  patch --directory="${_pyname}" -p1 -i "$srcdir/0001-pySim-shell.py-make-it-work-with-cmd2-v2.0.0.patch"
  patch --directory="${_pyname}" -p1 -i "$srcdir/0002-pySim-shell.py-make-it-work-with-cmd2-v2.4.0.patch"
}

package() {
  install=$pkgname.install
  cd "${srcdir}/${_pyname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
