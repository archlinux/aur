# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-laspec
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2023.819.0
pkgrel=1
pkgdesc="A toolkit for LAMOST spectra."
arch=('any')
url="https://laspec.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer'
#            'python-sphinx')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-for-numpy1.24.patch')
md5sums=('4156c6a305778072f819fe20b0cfe90a'
         '3b9dd6dc44a6d6912989f67a8be57357')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-for-numpy1.24.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest #|| warning "Tests failed"
    nosetests -v -x || warning "Tests failed"
}

package_python-laspec() {
    depends=('python>=3.7' 'python-scipy' 'python-astropy' 'python-lmfit' 'python-tensorflow')
#   optdepends=('python-laspec-doc: Documentation for laspec')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-laspec-doc() {
#    pkgdesc="Documentation for Python laspec"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
