# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-naima
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.10.2
pkgrel=1
pkgdesc="Derivation of non-thermal particle distributions through MCMC spectral fitting"
arch=('any')
url="https://naima.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-hatch-vcs'
             'python-build'
             'python-installer')
#'python-astropy' 'python-astropy-helpers>=3.1' 'python-sphinx-astropy' 'python-emcee')
checkdepends=('python-pytest' 'python-astropy' 'python-h5py' 'python-scipy' 'python-matplotlib' 'python-emcee>3' 'python-sherpa')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('eb8b4909092f30fafdbe013c504665b7')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed"
}

package_python-naima() {
    depends=('python>=3.10' 'python-astropy>=6.1' 'python-h5py' 'python-emcee>3' 'python-corner' 'python-scipy' 'python-matplotlib' 'python-yaml')
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
