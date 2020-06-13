# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-iminuit
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}")
pkgver=1.3.10
pkgrel=1
pkgdesc="Python interface for MINUIT, a physics analysis tool for function minimization."
arch=('i686' 'x86_64')
url="http://iminuit.readthedocs.io"
license=('GPL' 'MIT')
makedepends=('cython2' 'python2-numpy')
checkdepends=('python2-pytest' 'python2-backports.functools_lru_cache')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3ac6ae34905409acdd053e5551b3c95d')

prepare() {
    export _pyver=$(python2 -V | cut -c 8-10)
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}/build/lib.linux-${CARCH}-2.7

    pytest2 || warning "Tests failed"
}

package_python2-iminuit() {
    depends=('python2>=2.7' 'python2-numpy>=1.11.3')
    optdepends=('ipython2'
                'python2-matplotlib'
                'python2-pytest-cov: For testing and get a coverage report'
                'cython2'
                'python2-sphinx: For docs building'
                'python-iminuit-doc: Documentation for python-iminuit')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
