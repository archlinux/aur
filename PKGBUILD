# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stsci.skypac
_pname=${pkgbase#python-}
_pyname=${_pname//./_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.0.11
pkgrel=1
pkgdesc="Sky matching for image mosaic"
arch=('any')
url="https://stsci-skypac.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-numpydoc'
             'python-stwcs'
             'python-stsci.imagestats'
             'python-spherical_geometry>=1.2.2'
             'texlive-latexextra')  # latex.fmt: -latex; anyfontsize.sty: latexextra
#            'python-pytest-runner'
#            'python-sphinx_rtd_theme'
checkdepends=('python-pytest-doctestplus')
#            'python-pytest-xdist'
#            'python-sphinx'
#source=("https://github.com/spacetelescope/stsci.skypac/archive/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-doc-underline-length.patch'
        'setup.cfg')
md5sums=('5a460611a9bb30a2641d3cbfe3a095d5'
         '4f6d5bbf0720af0687f560e8ae97762b'
         'b9f7309fbf09f7a05455a1d176b9e492')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
#   cat ${srcdir}/setup.cfg >> setup.cfg
    sed -i 's/distutils./packaging./' docs/conf.py
#   patch -Np1 -i "${srcdir}/fix-doc-underline-length.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -sf $(get_pyinfo site)/stsci/* stsci
    PYTHONPATH="${PWD}" make -C docs html
#   ln -sf $(get_pyinfo site)/stsci/* build/lib/stsci
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    isdr=($(ls --ignore=skypac stsci))
    ign=${isdr[@]/#/--ignore=stsci/}
    pytest ${ign[@]} || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-stsci.skypac() {
    depends=('python>=3.10' 'python-astropy>=5.0.4' 'python-spherical_geometry>=1.2.2' 'python-stwcs' 'python-stsci.imagestats' 'python-packaging>=21.1')
    optdepends=('python-stsci.skypac-doc: Documentation for STScI skypac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm "${pkgdir}/$(get_pyinfo site)/stsci/__init__.py"
    rm "${pkgdir}/$(get_pyinfo site)/stsci/__pycache__"/*
}

package_python-stsci.skypac-doc() {
    pkgdesc="Documentation for STScI skypac"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
