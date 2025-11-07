# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-mocpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.19.1
pkgrel=1
pkgdesc="MOC parsing and manipulation in Python"
arch=('i686' 'x86_64')
url="https://cds-astro.github.io/mocpy"
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
             'python-toml'
             'pandoc')
checkdepends=('python-pytest-mock'
#             'python-pytest-xdist'
              'python-regions')   # cdshealpix, matplotlib, requests <- scipy <- networkx already in makedepends
# test need ./resources from github
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/cds-astro/mocpy/archive/refs/tags/v${pkgver}.tar.gz")
#       "cutout-CDS_P_2MASS_K.fits::http://alasky.u-strasbg.fr/hips-image-services/hips2fits?hips=CDS%2FP%2F2MASS%2FK&width=1200&height=700&fov=30&projection=TAN&coordsys=galactic&rotation_angle=0.0&object=gal%20center&format=fits"
#       "http://skies.esac.esa.int/Spitzer/IRAC1_bright_ISM/Moc.fits"
#       'doc-use-local-fits.patch')
md5sums=('eb59113127f8756e08b89d970311b787')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "s:parent$:parent.parent:" python/mocpy/tests/test_sfmoc.py
#   cp ${srcdir}/*.fits docs/examples
#   patch -Np1 -i "${srcdir}/doc-use-local-fits.patch"
#   install -Dm644 notebooks/* -t docs/_collections/notebooks
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
    depends=('python>=3.9'
             'python-astropy')
    optdepends=('python-cdshealpix>=0.6.4: plots, used in fill and border'
                'python-matplotlib: plots, used in fill and border'
                'python-networkx>=2.5: plots, used in get_boundaries'
                'python-mocpy-doc: Documentation for MOCPy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-mocpy-doc() {
    pkgdesc="Documentation for Python MOCPy"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
