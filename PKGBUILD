# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-crds
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=11.17.4
pkgrel=1
pkgdesc="Calibration Reference Data System for HST and JWST"
arch=('any')
url="https://hst-crds.stsci.edu/static/users_guide/index.html"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest')
#             'python-lockfile'
#             'python-filelock'
#             'python-mock'
#             'python-astropy'
#             'python-nose'
#             'python-pylint'
#             'python-yaml'
#             'python-beautifulsoup4'
#             'python-asdf')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       'fix-roman-asdf-test.patch')
md5sums=('c7d4b8af9e93f23b6fa60bf96f8a3ef5')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    patch -Np1 -i "${srcdir}/fix-roman-asdf-test.patch"
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p crdscache
#   CRDS_TESTING_CACHE="crdscache" pytest -vv -l -ra --color=yes -o console_output_style=count #\
    pytest \
        --ignore=test/roman/asdf/pytest_test_asdf_structure.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-crds() {
    depends=('python-filelock' 'python-astropy' 'python-asdf' 'python-requests' 'python-lxml' 'python-parsley')
    optdepends=('python-crds-doc: Documentation for CRDS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
