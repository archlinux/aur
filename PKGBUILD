# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-intersphinx-registry
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
# "python-${_pname}-doc")
pkgver=0.2511.25
pkgrel=1
pkgdesc="This package provides convenient utilities and data to write a sphinx config file."
arch=('any')
url="https://github.com/Quansight-Labs/intersphinx_registry"
license=('MIT')
makedepends=('python-flit-core'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest-xdist'
              'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-test_basic.py::https://github.com/Quansight-Labs/intersphinx_registry/raw/refs/tags/${pkgver}/tests/test_basic.py")
md5sums=('c4e856c7c0b07e55b05be75970784306'
         'eea8ea533c4d906be19ffb096eb37eb1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir tests
#   cp {${srcdir}/${pkgver}-,tests/}test_basic.py
    cp {${srcdir}/${pkgver}-,}test_basic.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest test_basic.py -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
    PYTHONPATH="." pytest test_basic.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-intersphinx-registry() {
    depends=('python')
#   optdepends=('python-intersphinx-registry-doc: Documentation for Intersphinx Registry')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-intersphinx-registry-doc() {
#    pkgdesc="Documentation for Python Intersphinx Registry"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
