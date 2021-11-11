# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pydl
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.7.0
pkgrel=2
pkgdesc="Python replacements for functions that are part of the IDL built-in library or part of astronomical IDL libraries"
arch=('any')
url="http://pydl.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-setuptools' 'python-scipy' 'python-astropy' 'python-astropy-helpers' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/73/87/397a0d22112f48b794b39613ee3bddd315e64a38b33f24898962c4def5e4/pydl-0.7.0.tar.gz")
md5sums=('0bf0921aef8f5acbf192ac5c49f0d46c')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-pydl() {
    depends=('python-scipy' 'python-astropy' 'python-matplotlib')
    optdepends=('python-pytest-astropy: For testing'
                'python-pydl-doc: Documentation for PyDL')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-pydl-doc() {
    pkgdesc="Documentation for PyDL"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
