# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pydl
pkgname=('python-pydl' 'python2-pydl' 'python-pydl-doc')
pkgver=0.6.0
pkgrel=1
pkgdesc="Python replacements for functions that are part of the IDL built-in library or part of astronomical IDL libraries"
arch=('i686' 'x86_64')
url="http://pydl.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython' 'cython2' 'python-astropy' 'python-astropy-helpers' 'python2-astropy-helpers' 'python-sphinx' 'python-numpydoc' 'python-matplotlib')
#checkdepends=('python-pytest-astropy' 'python2-pytest' 'python2-astropy')
source=("https://files.pythonhosted.org/packages/source/p/pydl/pydl-${pkgver}.tar.gz")
md5sums=('4c024738a89e4229bfa4ce2beb3f4f14')

prepare() {
    cd ${srcdir}/pydl-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/pydl-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/pydl-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/pydl-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check(){
#    cd $srcdir/pydl-${pkgver}
#    python setup.py test
#
#    cd $srcdir/pydl-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-pydl() {
    depends=('python2' 'python2-astropy' 'python2-matplotlib')
    optdepends=('python2-pytest: For testing'
                'python-pydl-doc: Documentation for PyDL')
    cd ${srcdir}/pydl-${pkgver}-py2

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/compute_templates{,2}
    mv ${pkgdir}/usr/bin/get_juldate{,2}
    mv ${pkgdir}/usr/bin/hogg_iau_name{,2}
}

package_python-pydl() {
    depends=('python' 'python-astropy' 'python-matplotlib')
    optdepends=('python-pytest-astropy: For testing'
                'python-pydl-doc: Documentation for PyDL')
    cd ${srcdir}/pydl-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-pydl-doc() {
    pkgdesc="Documentation for PyDL"
    cd ${srcdir}/pydl-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
