# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-asdf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.1.4
pkgrel=3
pkgdesc="Sphinx plugin for generating documentation from ASDF schemas"
arch=('any')
url="https://github.com/asdf-format/sphinx-asdf"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-sphinx'
              'python-asdf'
              'python-mistune=0.8.4')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('4f79db5412d7d1cd2649ce5fa42160e54942758beba2de30605a74f12a23365c')

get_pyver() {
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver).egg-info
    PYTHONPATH="build/lib" pytest || warning "Tests failed"
}

package() {
    depends=('python-asdf'
             'python-astropy>=5.0.4'
             'python-graphviz'
             'python-matplotlib'
             'python-myst-parser'
             'python-mistune=0.8.4'
             'python-sphinx-astropy'
             'python-sphinx-bootstrap-theme'
             'python-sphinx_rtd_theme'
             'python-sphinx-inline-tabs'
             'python-toml')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
