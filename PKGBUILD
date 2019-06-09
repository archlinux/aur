# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-naima
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.8.3
pkgrel=1
pkgdesc="Derivation of non-thermal particle distributions through MCMC spectral fitting"
arch=('i686' 'x86_64')
url="https://naima.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-astropy' 'python-astropy-helpers>=3.1' 'python2-astropy-helpers' 'python-sphinx-astropy' 'python-emcee')
checkdepends=('python-pytest-astropy' 'python2-pytest<3.7' 'python2-astropy' 'python-corner' 'python2-corner' 'python-yaml' 'python2-yaml' 'python2-emcee')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3970fed9996826054774fe770a959736')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-naima() {
    depends=('python2>=2.7' 'python2-astropy>=1.0.2' 'python2-emcee>=2.2.0' 'python2-corner')
    optdepends=('python2-sherpa: For using Sherpa models'
                'python-naima-doc: Documentation for Naima'
                'python2-pytest<3.7: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-naima() {
    depends=('python>=3.5' 'python-astropy>=1.0.2' 'python-emcee>=2.2.0' 'python-corner')
    optdepends=('python-sherpa: For using Sherpa models'
                'python-naima-doc: Documentation for Naima'
                'python-pytest: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-naima-doc() {
    pkgdesc="Documentation for Python Naima module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
