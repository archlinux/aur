# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-starlink-pyast
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
pkgver=4.0.0
pkgrel=1
pkgdesc="Python interface to the Starlink AST library"
arch=('i686' 'x86_64')
url="http://starlink.eao.hawaii.edu/starlink/AST"
license=('LGPL-3.0-or-later')
makedepends=('python-setuptools-scm>=8.0'
             'python-build'
             'python-installer'
             'python-numpy'
             'libyaml')
checkdepends=('python-scipy')
#              'python-astropy'
#              'python-matplotlib'
#              )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('80796a9d0fb10b7f4618f60d55d17451')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" python src/starlink/ast/test/test.py || warning "Tests failed"
#   PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" python -m unittest discover -v -s src/starlink/ast/test #|| warning "Tests failed"
}

package_python-starlink-pyast() {
    depends=('python-numpy' 'libyaml')
    optdepends=('python-astropy: Support for starlink.Atl'
                'python-matplotlib: Support for starlink.Atl and starlink.Grf')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
