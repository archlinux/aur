# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pyspeckit
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.1.21
pkgrel=1
pkgdesc="Toolkit for fitting and manipulating spectroscopic data in python"
arch=('i686' 'x86_64')
url="https://pyspeckit.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-astropy' 'python-astropy-helpers>=3.1' 'python2-astropy-helpers' 'python-sphinx-astropy')
checkdepends=('tk' 'python-pytest-astropy' 'python-spectral-cube')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'correct_doc_examples.patch')
md5sums=('e276915c2865e0e64dc132a3b9cb0b23'
         'b1ea9f4f4d2c467c26c34293bfbd387f')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    patch -Np1 -i "${srcdir}/correct_doc_examples.patch"
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
#   msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

#   msg "Checking Python2"
#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
}

package_python2-pyspeckit() {
    depends=('python2-numpy>=1.4' 'python2-astropy>=1.0' 'python2-matplotlib>=1.4')
    optdepends=('hdf5'
                'python2-atpy'
                'python2-spectral-cube'
                'python2-lmfit'
                'python-pyspeckit-doc: Documentation for PySpecKit'
                'python2-pytest: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README*
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    sed -i -e '/\#\/bin/s/ipython/ipython2/' ${pkgdir}/usr/bin/pyspeckit_script.py
    mv ${pkgdir}/usr/bin/astropy-package-template-example{,2}
    mv ${pkgdir}/usr/bin/pyspeckit_script{,2}.py
}

package_python-pyspeckit() {
    depends=('python-numpy>=1.4' 'python-astropy>=1.0' 'python-matplotlib>=1.4')
    optdepends=('hdf5'
                'python-atpy'
                'python-spectral-cube'
                'python-lmfit'
                'python-pyspeckit-doc: Documentation for PySpecKit')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README*
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-pyspeckit-doc() {
    pkgdesc="Documentation for Python PySpecKit module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
