# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pytest-import-check
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
# "python-${_pname}-doc")
pkgver=0.0.4
pkgrel=1
pkgdesc="pytest plugin to check whether Python modules can be imported"
arch=('any')
url="https://github.com/projg2/pytest-import-check"
license=('GPL-2.0-or-later')
makedepends=('python-flit-core'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-setuptools'
              'meson')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3261bb2f565c5b30a039df9044eca4f1')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-pytest-import-check() {
    depends=('python>=3.9' 'python-pytest>=8.1')
#   optdepends=('python-pytest-import-check: Documentation for pytest-import-check')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-pytest-import-check-doc() {
#    pkgdesc="Documentation for Python pytest-import-check"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
