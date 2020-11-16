# Maintainer: Batuhan Baserdem
# vim:ft=PKGBUILD

_name=matlab_kernel
pkgname="jupyter-${_name}-git"
pkgver=0.16.11.r0.g1bc5c76
pkgrel=1
pkgdesc="A Jupyter/IPython kernel for Matlab"
arch=('any')
url="https://github.com/Calysto/${_name}.git"
license=('BSD')
depends=('python' 'jupyter' 'jupyter-metakernel')
makedepends=('git' 'jupyter-metakernel')
optdepends=('matlab-engine-for-python: Runtime dependency on matlab kernel.')
provides=("jupyter-${_name}")
conflicts=("jupyter-${_name}")
source=("git+https://github.com/Calysto/${_name}.git"
        'matlab_kernel.install')
sha256sums=('SKIP'
            '75b428259fe22704a5ba61b6b9915b55245549d53a1dfdeed95fa3c93a2beac1')

pkgver() {
    # Get git version name
    cd "${_name}"
    git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}

build() {
    # Build files
    cd "${srcdir}/${_name}"
    python setup.py build
}

package() {
    # Install files
    cd "${srcdir}/${_name}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    # Install license
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Input links to images
    _pyver="$(python --version | grep -o "3\.[0-9]")"
    _pypre="$(python -c 'import sys; print(sys.prefix)')"
    _pydir="${_pypre}/lib/python${_pyver}/site-packages"
    _lndir="${pkgdir}/usr/share/jupyter/kernels/${_name}"
    install -dm 0755 "${_lndir}"
    ln -s "${_pydir}/metakernel/images/logo-32x32.png" "${_lndir}/logo-32x32.png"
    ln -s "${_pydir}/metakernel/images/logo-64x64.png" "${_lndir}/logo-64x64.png"
}
