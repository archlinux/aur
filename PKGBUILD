# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-iminuit
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.4.5
pkgrel=1
pkgdesc="Python interface for MINUIT, a physics analysis tool for function minimization."
arch=('i686' 'x86_64')
url="http://iminuit.readthedocs.io"
license=('GPL' 'MIT')
makedepends=('cython' 'python-numpy')
checkdepends=('python-pytest')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('36e779e1811ada1767b531baf8a24f7c')

prepare() {
    export _pyver=$(python -V | cut -c 8-10)
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}/build/lib.linux-${CARCH}-${_pyver}
    pytest || warning "Tests failed"
}

package_python-iminuit() {
    depends=('python>=3.5' 'python-numpy>=1.11.3')
    optdepends=('ipython'
                'python-matplotlib'
                'python-pytest-cov: For testing and get a coverage report'
                'cython'
                'python-sphinx: For docs building'
                'python-iminuit-doc: Documentation for python-iminuit')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
