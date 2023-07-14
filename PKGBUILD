# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-autosummary-accessors
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2023.4.0
pkgrel=1
pkgdesc="Sphinx autosummary extension to properly format pandas or xarray accessors"
arch=('any')
url="https://sphinx-autosummary-accessors.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx'
             'python-sphinx_rtd_theme')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
md5sums=('46508e80786803f53006d0989ccd16cb'
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
    depends=('python-sphinx>=3.5')
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
