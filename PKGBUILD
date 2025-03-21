# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stsci.stimage
_pname=${pkgbase#python-}
_pyname=${_pname//./_}
pkgname=("python-${_pname}")
pkgver=0.3.0
pkgrel=1
pkgdesc="STScI image processing"
arch=('i686' 'x86_64')
url="https://stscistimage.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-numpy')  # wheel required by new setuptools
#            'gcc13'
checkdepends=('python-pytest')
#checkdepends=('python-pytest-xdist')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('0c4ad27bbbcff9437951ade4adf4f595')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   CC=gcc-13 CXX=g++-13 python -m build --wheel --no-isolation --skip-dependency-check
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp "build/lib.linux-${CARCH}-cpython-$(get_pyver)"/stsci/stimage/*-linux-gnu.so stsci/stimage
    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #"build/lib.linux-${CARCH}-cpython-$(get_pyver)"
}

package_python-stsci.stimage() {
    depends=('python-numpy>=1.14')
    optdepends=('python-stsci.stimage-doc: Documentation for STScI STImage')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
