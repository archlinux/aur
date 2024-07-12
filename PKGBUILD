# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-nestle
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.0
pkgrel=3
pkgdesc="Nested sampling algorithms for evaluating Bayesian evidence"
arch=('any')
url="http://kylebarbary.com/nestle/"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer'
checkdepends=('python-pytest'
              'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-runtest.py::https://github.com/kbarbary/nestle/raw/v${pkgver}/runtests.py")
md5sums=('49e14a2fc989ced42db7f0c411162e00'
         '5173344e73e9b33ef77d40bbabb729f5')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs {${srcdir}/${pkgver}-,}runtest.py
    sed -i -e "s/np\.int/int/" -e "s/np.float)/np.float64)/" -e "s/np.product/np.prod/" nestle.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   nosetests -v -x || warning "Tests failed"
    pytest runtest.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#   PYTHONPATH="build/lib" python runtest.py
}

package_python-nestle() {
    depends=('python-numpy>=1.6')
    optdepends=('python-scipy'
                'python-nestle-doc: Documentation for Nestle')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
