# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-arviz-plots
_pname=${pkgbase#python-}
_pyname=${_pname}
#_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.2.0
pkgrel=1
pkgdesc="ArviZ-plots provides ready to use and composable plots for Bayesian Workflow."
arch=('any')
url="https://python.arviz.org/projects/plots"
license=('Apache-2.0')
makedepends=('python-flit-core>=3.4'
             'python-build'
             'python-installer')
#             'python-sphinx-copybutton'
#             'python-sphinx_design'
#             'python-sphinx-book-theme'
#             'python-jupyter-sphinx'
#             'python-bokeh'
#             'python-matplotlib'
#             'python-myst-nb'
#             'python-numpydoc'
#             )  # takes long time
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-hypothesis'
              'python-arviz-base'
              'python-arviz-stats'
              'python-bokeh'
              'python-matplotlib'
              'python-h5netcdf'
              'python-plotly'
              'python-webcolors'
              'python-xarray-einstats')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/arviz-devs/arviz-plots/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('351882ee2cbb4e7a35065845d985c1f8')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    # Fixed by xarray-einstats
#    sed -i "s:arviz_stats:arviz_stats.visualization:" src/arviz_plots/plots/utils.py
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="../../dist/lib" env -C docs/source sphinx-build -b html -d _build/doctrees . _build/html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-arviz-plots() {
    depends=('python>=3.12'
             'python-arviz-base>=1.2'
             'python-arviz-stats>=1.2'
             'python-xarray-einstats')
    optdepends=('python-bokeh>=3.4: bokeh backend'
                'python-matplotlib>=3.9: bokeh backend'
                'python-plotly>=5.19: plotly backend'
                'python-webcolors: plotly backend')
#               'python-arviz-plots-doc: Documentation for arviz-plots')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-arviz-plots-doc() {
#    pkgdesc="Documentation for Python arviz-plots"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/source/_build
#
##   install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
