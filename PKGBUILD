# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-radio_beam
_pname=${pkgbase#python-}
_pyname=${_pname/_/-}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.3.3
pkgrel=2
pkgdesc="A tool for manipulating and utilizing two dimensional gaussian beams within the astropy framework"
arch=('any')
url="https://radio-beam.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-astropy'
             'python-sphinx-astropy')
checkdepends=('python-pytest-astropy' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1a019b5fb8f3449710c028f777316e38')

get_pyver() {
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}

    sed -i "/astropy.tests.plugins.display/s/astropy.tests.plugins/pytest_astropy_header/" conftest.py
}

build() {
    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver).egg-info
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
   cd ${srcdir}/${_pyname}-${pkgver}

   pytest "build/lib" || warning "Tests failed"
}

package_python-radio_beam() {
    depends=('python' 'python-astropy' 'python-six' 'python-scipy')
    optdepends=('python-pytest-astropy: For testing'
                'python-radio_beam-doc: Documentation for Radio Beam')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-radio_beam-doc() {
    pkgdesc="Documentation for Python Radio Beam module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
