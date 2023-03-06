# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-jaraco.tidelift
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.5.1
pkgrel=1
pkgdesc="Tools for Tidelift by jaraco"
arch=('any')
url="https://github.com/jaraco/jaraco.tidelift"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-furo'
             'python-jaraco.packaging'
             'python-rst.linker'
             'python-importlib_resources')
checkdepends=('python-nose')
#checkdepends=('python-pytest'  # nothing to test
#              'python-importlib_resources'
#              'python-docutils'
#              'python-keyring'
#              'python-requests-toolbelt')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
md5sums=('38a2d363e08ff0f8b6c324e5adfb5b08'
         'a6aa4bc42b138d75f938065a0994c3e1')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -s ${srcdir}/Makefile docs
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#       build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest -vv --color=yes #|| warning "Tests failed"
    nosetests || warning "Tests failed"
}

package_python-jaraco.tidelift() {
    depends=('python>=3.7'
             'python-autocommand'
             'python-requests-toolbelt'
             'python-keyring'
             'python-importlib_resources>=1.6')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-jaraco.tidelift-doc() {
    pkgdesc="Documentation for Python ndcube module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
