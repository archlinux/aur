# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-astlib
_pyname=${pkgbase#python-}
#_pyname=astLib
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.12.1
pkgrel=1
pkgdesc="A set of Python modules that provides some tools for research astronomers"
arch=('i686' 'x86_64')
url="https://astlib.readthedocs.io"
license=('LGPL-2.0-only')
makedepends=('python-setuptools'
#            'python-wheel'
#            'python-build'
#            'python-installer'
             'wcstools-all'
             'swig'
             'python-sphinx-epytext'
             'python-readthedocs-sphinx-ext'
             'python-sphinx_rtd_theme'
             'python-astropy'
             'python-scipy'
             'python-matplotlib')
checkdepends=('python-pytest')
# astropy scipy matplotlib already in makedepends
##             'python-astropy'
##             'python-scipy'
##             'python-matplotlib'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'use_system_wcstools.patch'
        'fix-deprecated-imp.patch')
sha256sums=('cba26f1c1177ff158fac50326bae15bbb6625e80946b69b1e445862dc8de73a8'
            'df8f7b7688db376b041c965727597b78e0911ab92ef467816a8bb7a3a62ffc1f'
            'ea99eedbe5d67ebed17f3383d6b1eaf7a8b1f38a2d3e009fa69a8a084487185b')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/use_system_wcstools.patch"
    mkdir -p docs/_static
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check(){
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-astlib() {
    depends=('python-scipy>=1.7' 'python-matplotlib>=3.0' 'python-astropy>=3.2' 'wcstools-all')
    optdepends=('python-astlib-doc: Documentation for astLib')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -a examples -t "${pkgdir}/usr/share/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --skip-build
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astlib-doc() {
    pkgdesc="Documentation for astLib"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
