# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-astlib
_paname=${pkgbase#python-}
_pyname=astLib
pkgname=("python-${_paname}" "python-${_paname}-doc")
pkgver=0.11.10
pkgrel=1
pkgdesc="A set of Python modules that provides some tools for research astronomers"
arch=('i686' 'x86_64')
url="https://astlib.readthedocs.io"
license=('LGPL')
makedepends=('python-setuptools'
#            'python-wheel'
#            'python-build'
#            'python-installer'
             'wcstools-all'
             'swig')
#            'python-sphinx-epytext'
#            'python-readthedocs-sphinx-ext'
#            'python-sphinx_rtd_theme'
#            'python-astropy'
#            'python-scipy'
#            'python-matplotlib')
checkdepends=('python-pytest'
              'python-astropy'
              'python-scipy'
              'python-matplotlib')
# astropy scipy matplotlib already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'use_system_wcstools.patch'
        'fix-deprecated-imp.patch')
sha256sums=('c7a7edf73202e35a07d363cd60fa1ee77faef9f605f29b69e91b1654138ba72e'
            'cb8e9bfabc91992c49daae7d5bc6a476caedd5c3b5c60f26f32bcbb216daf6cd'
            'bb98c544a695f5ca6a5f614557459dd6f1921f81c8c4ef02b5923f7ce6ff5ec3')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/use_system_wcstools.patch"
#   patch -Np1 -i "${srcdir}/fix-deprecated-imp.patch"
#   mkdir -p docs/_static
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check(){
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
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
