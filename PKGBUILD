# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pydl
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.7.0
pkgrel=1
pkgdesc="Python replacements for functions that are part of the IDL built-in library or part of astronomical IDL libraries"
arch=('i686' 'x86_64')
url="http://pydl.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-setuptools' 'python-astropy' 'python-astropy-helpers' 'python2-astropy-helpers' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy' 'python2-pytest32' 'python2-matplotlib' 'python2-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "python2-${_pyname}.install")
md5sums=('0bf0921aef8f5acbf192ac5c49f0d46c'
         '49781cc7f77b9620ebd1252f17c0aa9e')

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

    if [ -z $(pacman -Qsq python2-pytest-cov) ]; then
        msg "Checking Python2"
        cd ${srcdir}/${_pyname}-${pkgver}-py2
        python2 setup.py test
    fi
}

package_python2-pydl() {
    depends=('python2' 'python2-astropy' 'python2-matplotlib')
    optdepends=('python2-pytest32: For testing'
                'python-pydl-doc: Documentation for PyDL')
    install=python2-${_pyname}.install
    cd ${srcdir}/${_pyname}-${pkgver}

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
    cd ${srcdir}/${_pyname}-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-pydl-doc() {
    pkgdesc="Documentation for PyDL"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
