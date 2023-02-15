# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.stimage
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.6
pkgrel=1
pkgdesc="STScI image processing"
arch=('i686' 'x86_64')
url="https://stscistimage.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a5f64e37f8ba14367dd0720a6b14a6e8')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e "/oldest-supported-numpy/d" -e "/\"wheel\"/s/,//" pyproject.toml
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv --color=yes
}

package_python-stsci.stimage() {
    depends=('python-numpy>=1.14')
    optdepends=('python-stsci.stimage-doc: Documentation for STScI STImage')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
