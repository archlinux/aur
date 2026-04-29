# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-arviz-stats
_pname=${pkgbase#python-}
_pyname=${_pname}
#_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
# "python-${_pname}-doc")
pkgver=1.1.0
pkgrel=1
pkgdesc="Statistical computation and diagnostics for ArviZ."
arch=('any')
url="https://python.arviz.org/projects/stats"
license=('MIT')
makedepends=('python-flit-core>=3.4'
             'python-build'
             'python-installer')
#             'python-sphinx-autosummary-accessors'
#             'python-sphinx-copybutton'
#             'python-sphinx_design'
#             'python-sphinx-book-theme'
#             'python-jupyter-sphinx'
#             'python-myst-nb'
#             'python-numpydoc'
#             )  # takes long time
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-arviz-base'
              'python-scipy'
              'python-h5netcdf'
              'python-numba'
              'python-xarray-einstats'
              'python-einops')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/arviz-devs/arviz-stats/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('9175f749ab4ae49aef5900dfaf3914fa')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="../../dist/lib" env -C docs/source sphinx-build -b html -d _build/doctrees . _build/html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-arviz-stats() {
    depends=('python>=3.12'
             'python-numpy>=2'
             'python-scipy>=1.13')
    optdepends=('python-arviz-base>=1.1'
                'python-xarray-einstats'
                'python-xarray>=2024.11.0')
#               'python-arviz-stats-doc: Documentation for arviz-base')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-arviz-stats-doc() {
#    pkgdesc="Documentation for Python arviz-stats"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/source/_build
#
##   install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
