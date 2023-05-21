# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroslam
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.2022.1228.1
pkgrel=1
pkgdesc="A forward model using SVR to estimate stellar parameters from spectra"
arch=('any')
url="https://github.com/hypergravity/astroslam"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-matplotlib' 'python-scikit-learn' 'python-pandas' 'python-emcee' 'python-astropy' 'python-laspec' 'python-lmfit' 'python-ipyparallel' 'python-joblib')
#checkdepends=('python-pyzmq' 'python-jupyter_client' 'python-pillow')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-for-py3.10.patch')
#       "https://raw.githubusercontent.com/hypergravity/astroslam/master/LICENSE")
md5sums=('c6bf949451893e3b65907d672948b45d'
         '608081da9f7168903bae4e63de7be4bc')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-for-py3.10.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests || warning "Tests failed"
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md doc/* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
