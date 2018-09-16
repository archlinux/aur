# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-gpy
pkgver=1.9.5
pkgrel=1
pkgdesc="Gaussian processes framework in python"
arch=("any")
license=("BSD")
url="https://github.com/SheffieldML/GPy"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-paramz' 'python-matplotlib' 'python-climin-git')
optdepends=('python-plotly' 'ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook' 'python-mpi4py')
makedepends=('python-setuptools' 'python-numpy' 'cython')
source=("https://github.com/SheffieldML/GPy/archive/v${pkgver}.tar.gz"
        "cython-v1.9.5.patch")
sha512sums=("e4d45b426977ef1d987ffde9275adeeac3eb85874cee4049f40a255c14a54ebcfb7e1c402046af6818e20a7b166e51162731d3d904f2e43e830519c6c9489ae2"
            "1c173cdac44e13663a6320528fa4a772c17adb37039dbda34633f1d4912ea5c3192cc7b13ac61bc036e06c538e5b5b63201b3a72ca7ebc37234dd2643e62ac0e")

prepare() {
    # Fix Cython compilation errors (https://github.com/SheffieldML/GPy/pull/677)
    patch -p1 -i cython-v1.9.5.patch
    
    cd "GPy-${pkgver}"
    
    # Forcibly update cython for python 3.7 (https://github.com/SheffieldML/GPy/issues/649)
    find . -name '*.pyx' -exec cython {} \;
}

build() {
    cd "GPy-${pkgver}"
    python setup.py build
}

package() {
    cd "GPy-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-gpy/LICENSE"
}
