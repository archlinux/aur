# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-oldest-supported-numpy
_pyname=${pkgname#python-}
pkgver=2022.1.30
pkgrel=1
pkgdesc="Meta-package providing oldest supported Numpy for given Python version and platform"
arch=('any')
url="https://github.com/scipy/oldest-supported-numpy"
license=('BSD')
depends=('python-numpy')
#makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
makedepends=('python-setuptools')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9d585c821298c6a093056d32c3a9ee6d')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    export _npver=$(python -c 'import numpy; print(numpy.__version__)')
    #sed -i '/'"${_pyver}"'/!b;n;c\numpy=='"${_npver}" oldest_supported_numpy.egg-info/requires.txt
    sed -i "/${_pyver}/s/==.*;/==${_npver};/" setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   python setup.py test
#    pytest
#}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    #python -m installer --destdir="${pkgdir}" dist/*.whl
}
