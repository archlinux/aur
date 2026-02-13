# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-neo-lzf
_pyname=${pkgbase//-/_}
pkgname=("${pkgbase}")
# "python-${_pname}-doc")
pkgver=0.3.5
pkgrel=1
pkgdesc="A fork of python-lzf with pre-built wheel files."
arch=('i686' 'x86_64')
url="https://github.com/FledgeXu/python-neo-lzf"
license=('BSD-3-Clause')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'liblzf')  # wheel required by new setuptools
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-tests.py::https://github.com/FledgeXu/python-neo-lzf/raw/refs/tags/v${pkgver}/tests.py"
        'devender-liblzf.patch')
md5sums=('f6b7bad05e6e8d078627c829d9d25a20'
         'f16f68c6491d14316a0d40954505e695'
         'f9165145d88f1721451d2b957e452ffd')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    rm lzf_?.c lzf*h
    ln -rs {${srcdir}/${pkgver}-,}tests.py
    patch -Np1 -i "${srcdir}/devender-liblzf.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" python -m unittest -v || warning "Tests failed"
}

package_python-neo-lzf() {
    depends=('python>=3.7' 'liblzf')
    conflicts=("python-lzf")
    provides=("python-lzf")
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-neo-nzf-doc() {
#    pkgdesc="Documentation for Python neo lzf"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
