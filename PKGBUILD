# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-mocpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.17.1
pkgrel=1
pkgdesc="A healpix manipulation library"
arch=('i686' 'x86_64')
url="https://cds-astro.github.io/cds-healpix-python"
license=('BSD-3-Clause')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-matplotlib'
             'python-sphinx-copybutton'
             'python-sphinx-collections'
             'python-sphinxcontrib-bibtex'
             'python-nbsphinx'
             'python-astropy-healpix'
             'python-cdshealpix'
             'python-networkx'
             'pandoc')
checkdepends=('python-pytest-mock'
#             'python-pytest-xdist'
              'python-matplotlib'
              'python-regions')   # cdshealpix, matplotlib, networkx already in makedepends
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/cds-astro/mocpy/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('a750c9aaf3f0afcc000390d594c3f036')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-cp$(get_pyver)-cp$(get_pyver)-linux_${CARCH}.whl -C dist/lib
    PYTHONPATH="../dist/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-cp$(get_pyver)-cp$(get_pyver)-linux_${CARCH}.whl -C dist/lib
    pytest dist/lib || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-mocpy() {
    depends=('python>=3.8'
             'python-cdshealpix>=0.6.4'
             'python-matplotlib'
             'python-networkx>=2.5')
#   optdepends=('python-mocpy-doc: Documentation for MOCPy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-mocpy-doc() {
    pkgdesc="Documentation for Python MOCPy"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
