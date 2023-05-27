# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ewah-bool-utils
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.0.2
pkgrel=1
pkgdesc="EWAH Bool Array utils for yt"
arch=('i686' 'x86_64')
url="https://ewah-bool-utils.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools'
             'cython'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'python-sphinx'
             )
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-title-underline.patch')
md5sums=('15fcc163c39509377786e7388dc04c5e'
         '7c4351256659c6fe4d7d369e3ff57398')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
    sed -e "/^version =/c version = \"${pkgver}\"" -e "/^release =/c release = \"${pkgver}\"" \
        -e "/language\ = /s/None/'en'/" -i docs/conf.py
    patch -Np1 -i "${srcdir}/fix-title-underline.patch"
    mkdir -p docs/_static
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cp build/lib.linux-${CARCH}-cpython-$(get_pyver)/${_pyname}/*gnu.so ${_pyname}
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package_python-ewah-bool-utils() {
    depends=('python-numpy>=1.17.3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ewah-bool-utils-doc() {
    pkgdesc="Documentation for EWAH Bool Utils"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
