# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pyskein
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0
pkgrel=1
pkgdesc="Implementation of the Skein hash function"
arch=('i686' 'x86_64')
url="https://pythonhosted.org/pyskein/"
license=('GPL-3.0-only')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
#             'python-pytest-xdist'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e99c3e87375347dc27dedeef0b383b98')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-pyskein() {
    depends=('python>=3.1')
    optdepends=('python-pyskein-doc: Documentation for PySkein')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-pyskein-doc() {
    pkgdesc="Documentation for Python Skein"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}/html"
    cp -a doc/* "${pkgdir}/usr/share/doc/${pkgbase}/html"
}
