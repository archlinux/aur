# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.imagestats
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.8.0
pkgrel=1
pkgdesc="STScI clipped image statistics with core functionality of IRAF's imstatistics"
arch=('i686' 'x86_64')
url="https://stsciimagestats.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('aee640c7526cb4516a6699b60a154cb2')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-stsci.imagestats() {
    depends=('python>=3.9' 'python-numpy>=1.22')
    #'python-stsci.tools')
    optdepends=('python-stsci.imagestats-doc: Documentation for STScI Imagestats')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
