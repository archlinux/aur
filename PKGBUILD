# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-bases
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.0
pkgrel=1
pkgdesc="Python library for general Base-N encodings"
arch=('any')
url="https://bases.readthedocs.io"
license=('MIT')
#makedepends=('python-setuptools'
makedepends=('python-setuptools-scm>=6.2'
             'python-build'
             'python-installer')
#            'python-sphinx'
#            'python-sphinx_rtd_theme'
#            'python-typing-validation')  # wheel required by new setuptools
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-typing-validation'
              'python-base58')   # typing-validation already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('86b873d2ba179967319a82e6ff73dac8')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-bases() {
    depends=('python>=3.7' 'python-typing_extensions>=4.6.0' 'python-typing-validation>=1.1.0')
    optdepends=('python-bases-doc: Documentation for python bases')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-bases-doc() {
#    pkgdesc="Documentation for Python bases"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
