# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.skypac
_pname=${pkgbase#python-}
_pyname=${_pname//./_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.0.10
pkgrel=1
pkgdesc="Sky matching for image mosaic"
arch=('any')
url="https://stsci-skypac.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpydoc'
             'python-stsci_rtd_theme'
             'python-stwcs'
             'python-stsci.imagestats'
             'python-spherical_geometry>=1.2.2'
             'texlive-latexextra')  # latex.fmt: -latex; anyfontsize.sty: latexextra
#            'python-pytest-runner'
#            'python-sphinx_rtd_theme'
checkdepends=('python-pytest-doctestplus')   # stwcs, imagestats spherical_geometry already in makedepends
#source=("https://github.com/spacetelescope/stsci.skypac/archive/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-doc-underline-length.patch'
        'setup.cfg')
md5sums=('3b330075f9bad82e802c93ec17e5db17'
         '4f6d5bbf0720af0687f560e8ae97762b'
         'b9f7309fbf09f7a05455a1d176b9e492')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}


prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cat ${srcdir}/setup.cfg >> setup.cfg
    patch -Np1 -i "${srcdir}/fix-doc-underline-length.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/_/.}*egg-info \
        build/lib/${_pyname/_/.}-${pkgver}-py$(get_pyver).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-stsci.skypac() {
    depends=('python>=3.5' 'python-astropy>=3.1' 'python-spherical_geometry>=1.2.2' 'python-stwcs' 'python-stsci.imagestats')
    optdepends=('python-stsci.skypac-doc: Documentation for STScI skypac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm "${pkgdir}/usr/lib/python$(get_pyver .)/site-packages/stsci/__init__.py"
    rm "${pkgdir}/usr/lib/python$(get_pyver .)/site-packages/stsci/__pycache__"/*
}

package_python-stsci.skypac-doc() {
    pkgdesc="Documentation for STScI skypac"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
