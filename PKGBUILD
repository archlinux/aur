# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-naima
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.10.3
pkgrel=1
pkgdesc="Derivation of non-thermal particle distributions through MCMC spectral fitting"
arch=('any')
url="https://naima.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-hatch-vcs'
             'python-build'
             'python-installer')
#            'python-sphinx-astropy'
#            'python-matplotlib'
#            'python-astropy'
#            'python-emcee>=3.0'
#            'python-h5py'
#            'python-scipy'
#        )
#'python-astropy' 'python-astropy-helpers>=3.1' 'python-sphinx-astropy' 'python-emcee')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-matplotlib'
              'python-astropy'
              'python-emcee>=3.0'
              'python-h5py'
              'python-scipy'
              'python-sherpa')    # astropy, h5py, emcee, matplotlib, scipy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#        "${pkgver}-CrabNebula_SynSSC.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/CrabNebula_SynSSC.png"
#        "${pkgver}-RXJ1713_IC_chain_index.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_chain_index.png"
#        "${pkgver}-RXJ1713_IC_chain_cutoff.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_chain_cutoff.png"
#        "${pkgver}-RXJ1713_IC_corner.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_corner.png"
#        "${pkgver}-RXJ1713_IC_model_samples.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_model_samples.png"
#        "${pkgver}-RXJ1713_IC_model_samples_erange.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_model_samples_erange.png"
#        "${pkgver}-RXJ1713_IC_model_confs.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_model_confs.png"
#        "${pkgver}-RXJ1713_IC_model_confs_erange.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_model_confs_erange.png"
#        "${pkgver}-RXJ1713_IC_pdist.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_pdist.png"
#        "${pkgver}-RXJ1713_IC_We.png::https://github.com/zblz/naima/raw/refs/tags/${pkgver}/docs/_static/RXJ1713_IC_We.png"
#)
md5sums=('7a1da6214529432c3865a82d63c5b786')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_static
#
##   sed -i -e '/auto_use/s/True/False/' setup.cfg
#    for vpg in ${srcdir}/${pkgver}-*.png; do cp ${vpg} ${vpg##*-}; done
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#    msg "Building Docs"
#    mkdir -p dist/lib
#    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#    PYTHONPATH="../dist/lib" make -C docs html
##   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-naima() {
    depends=('python>=3.10'
             'python-astropy>=6.1'
             'python-h5py>=3.14.0'
             'python-emcee>=3.0'
             'python-corner>=2.0'
             'python-scipy>=1.15.3'
             'python-matplotlib>=3.10.0'
             'python-yaml>=6.0.2')
    optdepends=('python-sherpa: For using Sherpa models'
                'python-naima-doc: Documentation for Naima')
#               'python-pytest-astropy: For testing'
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-naima-doc() {
#    pkgdesc="Documentation for Python Naima module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
