# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ezpadova
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.0.5
pkgrel=1
pkgdesc="A python package that allows you to download PADOVA isochrones directly from website"
arch=('any')
url="http://mfouesneau.github.io/ezpadova"
license=('MIT')
makedepends=('python-setuptools-scm>=6.2'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx-copybutton'
             'python-sphinx_mdinclude'
             'python-sphinx-book-theme'
             'python-myst-nb'
             'python-matplotlib'
             'python-pandas'
             'python-scipy'
             'python-pytest')  # wheel required by new setuptools
#checkdepends=('python-pytest-xdist'
##              'python-requests'
#              'python-beautifulsoup4'
#             )   # pandas, requests <- scipy, bs4 <- pydata <- book-theme already in makedepends
#source=("https://github.com/mfouesneau/ezpadova/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://github.com/mfouesneau/ezpadova/archive/refs/tags/v.${pkgver}.tar.gz")
md5sums=('78cf2f1a4256e1d4f95f7d79cd7b9ba8')

build() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/${_pyname}-v.${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C doc html
}

check() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/${_pyname}-v.${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-ezpadova() {
    depends=('python>=3.9' 'python-requests' 'python-pandas' 'python-beautifulsoup4' 'python-scipy')
    optdepends=('python-ezpadova-doc: Documentation for EzPadova')
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/${_pyname}-v.${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ezpadova-doc() {
    pkgdesc="Documentation for Python EzPadova"
#   cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
    cd ${srcdir}/${_pyname}-v.${pkgver}/doc/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
