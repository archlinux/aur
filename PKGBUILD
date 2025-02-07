# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.tools
_pname=${pkgbase#python-}
_pyname=${_pname//./_}
pkgname=("python-${_pname}")
pkgver=4.2.0
pkgrel=1
pkgdesc="Collection of STScI utility functions"
arch=('any')
url="https://stscitools.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
#             'python-pytest-xdist'
              'python-astropy'
              'tk')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e4da63539322f544453fe97d669f00e4')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-stsci.tools() {
    depends=('python-astropy>=5.0.4' 'python-packaging')
    optdepends=('python-stsci.tools-doc: Documentation for STScI Tools')
    provides=("python-stscitools=${pkgver}")
    conflicts=('python-stscitools')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
