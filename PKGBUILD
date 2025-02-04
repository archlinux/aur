# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sep-pjw
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.3.8
pkgrel=1
pkgdesc="Astronomical source extraction and photometry library (forked from kbarbary)"
arch=('i686' 'x86_64')
url="https://sep-pjw.readthedocs.io"
license=('BSD-3-Clause' 'LGPL-3.0-or-later' 'MIT')
makedepends=('python-setuptools-scm>=8.0'
             'cython'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy>=2'
             'python-sphinx-copybutton'
             'python-sphinx-furo'
             'python-myst-parser'
             'python-nbsphinx'
             'python-numpydoc'
             'python-fitsio'
             'python-matplotlib'
             'pandoc')
checkdepends=('python-pytest'
              'python-astropy')   # fitsio can be used instead
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('cba2544dbd484a16ae22491949468464')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    # waiting for fitsio upgrading
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" pytest test.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-sep-pjw() {
    depends=('python-numpy>=1.23.5' 'python-sep>=1.4.0')
    optdepends=('python-sep-pjw-doc: Documentation for SEP-PJW')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -r ${pkgdir}/$(get_pyinfo site)/_version.py
}

package_python-sep-pjw-doc() {
    pkgdesc="Documentation for Python SEP-PJW"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
