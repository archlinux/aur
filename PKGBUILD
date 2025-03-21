# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-autosummary-accessors
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=2025.3.1
pkgrel=1
pkgdesc="Sphinx autosummary extension to properly format pandas or xarray accessors"
arch=('any')
url="https://sphinx-autosummary-accessors.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm>=7.0'
             'python-build'
             'python-installer'
             'python-sphinx'
             'python-sphinx_rtd_theme')  # wheel required by new setuptools
checkdepends=('python-nose')    # sphinx
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
md5sums=('522c8b36f2fea04e2100991cbba9eabc'
         'a6aa4bc42b138d75f938065a0994c3e1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -s ${srcdir}/Makefile docs
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest -vv --color=yes #|| warning "Tests failed" -vv --color=yes
    nosetests || warning "Tests failed" # -v -x
}

package_python-sphinx-autosummary-accessors() {
    depends=('python-sphinx>=5.3' 'python-packaging')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-sphinx-autosummary-accessors-doc() {
    pkgdesc="Documentation for sphinx-autosummary-accessors"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
