# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf-standard
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.0.2
pkgrel=1
pkgdesc="Standards document describing ASDF, Advanced Scientific Data Format"
arch=('any')
url="https://asdf-standard.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer' 'python-sphinx' 'python-sphinx-asdf' 'graphviz')
#checkdepends=('python-pytest' 'python-jsonschema')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1d189cee600c9020c7a1f5aa03871875')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest
#}

package_python-asdf-standard() {
    depends=('python>=3.8' 'python-importlib_resources>=3')
    optdepends=('python-asdf-standard-doc: Documentation for ASDF Standard')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-asdf-standard-doc() {
    pkgdesc="Documentation for ASDF Standard"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
