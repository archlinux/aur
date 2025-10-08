# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pybaum
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.1.3
pkgrel=1
pkgdesc="Tools to work with pytrees"
arch=('any')
url="https://pybaum.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-panels'
             'python-sphinx-autoapi'
             'python-pydata-sphinx-theme')  # wheel required by new setuptools
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-pandas')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/OpenSourceEconomics/pybaum/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c888f996b9b67d9ea0b6c33353959e2c')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -e "/np/d" -e "/pd/d" -e "/language\ = /s/None/'en'/" -i docs/source/conf.py
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/src/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest tests || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-pybaum() {
    depends=('python>=3.7')
    optdepends=('python-pybaum-doc: Documentation for pybaum')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-pybaum-doc() {
    pkgdesc="Documentation for Python pybaum"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
