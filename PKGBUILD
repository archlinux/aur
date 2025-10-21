# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-cdshealpix
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.7.2
pkgrel=1
pkgdesc="A healpix manipulation library"
arch=('i686' 'x86_64')
url="https://cds-astro.github.io/cds-healpix-python"
license=('BSD-3-Clause')
makedepends=('python-maturin'
             'python-build'
             'python-installer')
#            'python-sphinx-collections'
#            'python-sphinx-copybutton'
#            'python-sphinx-gallery'
#            'python-sphinxcontrib-bibtex'
#            'python-astropy-sphinx-theme'
#            'python-numpydoc'
#            'python-nbsphinx'
#            'python-matplotlib'
#            'python-astropy'
#            'python-mocpy'
#            'pandoc'
#            )  # circular dep
checkdepends=('python-pytest-benchmark'
#             'python-pytest-xdist'
              'python-matplotlib'
              'python-astropy-healpix')   # matplotlib
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ac73cbda485e60477b72b5e076c8288a')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   sed -i "/typing/a _matplotlib_missing = False" python/${_pyname}/skymap/skymap.py
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-cp$(get_pyver)-cp$(get_pyver)-linux_${CARCH}.whl -C dist/lib
#   PYTHONPATH="../dist/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-cp$(get_pyver)-cp$(get_pyver)-linux_${CARCH}.whl -C dist/lib
    pytest dist/lib || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-cdshealpix() {
    depends=('python>=3.8' 'python-astropy')
#   optdepends=('python-cdshealpix-doc: Documentation for CDSHealpix')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-cdshealpix-doc() {
#    pkgdesc="Documentation for Python CDSHealpix"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
