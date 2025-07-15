# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.7.5
pkgrel=1
pkgdesc="WCS based distortion models and coordinate transformation"
arch=('any')
url="https://stwcs.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest'
              'python-stsci.tools'
#             'python-matplotlib'
              'python-lxml'
              'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e4d810f0d3370619be445401fd8a7cdd')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-stwcs() {
    depends=('python>=3.8' 'python-astropy>=6.0' 'python-stsci.tools>=3.6' 'python-requests' 'python-lxml')
    optdepends=('python-stwcs-doc: Documentation for STWCS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
