# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-starlink-pyast
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=3.15.4
pkgrel=1
pkgdesc="Python interface to the Starlink AST library"
arch=('i686' 'x86_64')
url="http://starlink.eao.hawaii.edu/starlink/AST"
license=('LGPL3')
makedepends=('python-setuptools'
             'python-numpy'
             'libyaml'
             'gcc13')
#            'python-wheel'
#            'python-build'
#            'python-installer')
#checkdepends=('python-pytest'
#              'python-astropy'
#              'python-matplotlib'
#              )   #python-aiohttp tqdm
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('abb0759b0e725302b955d8058d8a5187')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    CC=gcc-13 CXX=g++-13 python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" python starlink/ast/test/test.py || warning "Tests failed"
}

package_python-starlink-pyast() {
    depends=('python-numpy' 'libyaml')
    optdepends=('python-astropy: Support for starlink.Atl'
                'python-matplotlib: Support for starlink.Atl and starlink.Grf')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
