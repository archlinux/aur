# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stcal
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.15.2
pkgrel=1
pkgdesc="STScI tools and algorithms used in calibration pipelines"
arch=('i686' 'x86_64')
url="https://stcal.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4'
             'cython>=0.29.21'
             'python-build'
             'python-installer'
             'python-numpy>=2.0.0'
             'python-sphinx-asdf'
             'python-drizzle'
             'python-scikit-image'
             'python-tweakwcs'
             'graphviz')  # wheel required by new setuptools; gwcs, spherical_geometry, stsci.. <- tweakwcs
#checkdepends=('python-pytest-doctestplus'
#             'python-pytest-xdist'
#              'python-opencv'
#             )   # gwcs(requests <- .. <- scipy) <- tweakwcs drizzle skimage(requests) already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a7f8317ff0a6582e6ececf508bbd0ec0')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    # Cost long time
#    mv src/{,_}${_pyname}
#    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
#}

package_python-stcal() {
    depends=('python>=3.11'
             'python-drizzle>=2.0.1'
             'python-gwcs>=0.25.2'
             'python-requests>=2.22'
             'python-scipy>=1.14.1'
             'python-scikit-image>=0.20.0'
             'python-tweakwcs>=0.8.8'
             'python-opencv>=4.6.0.66'
             'python-spherical_geometry>=1.2.22')
    optdepends=('python-stcal-doc: Documentation for stcal')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-stcal-doc() {
    pkgdesc="Documentation for Python STCal"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
