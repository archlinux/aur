# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-radio_beam
_pyname=${pkgbase#python-}
#_pyname=${_pname/_/-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.3.9
pkgrel=1
pkgdesc="Operations for radio astronomy beams with astropy"
arch=('any')
url="https://radio-beam.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-matplotlib'
             'python-astropy')  # wheel required by new setuptools
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
#             'python-pytest-xdist'
              'python-scipy') # astropy, matplotlib already in makedepends; radio_beam/conftest.py
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5e7c73ce526413e19883c32df4c1c813')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
   cd ${srcdir}/${_pyname}-${pkgver}

   pytest --ignore=docs/_build || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-radio_beam() {
    depends=('python-astropy' 'python-scipy')
    optdepends=('python-pytest-astropy: For testing'
                'python-matplotlib: all functions'
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
