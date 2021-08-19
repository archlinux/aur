# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-changelog
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.1.2
pkgrel=1
pkgdesc="A changelog renderer for sphinx"
arch=('any')
url="https://openastronomy.org"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-sphinx'
             'python-sphinx-automodapi'
             'towncrier')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/OpenAstronomy/sphinx-changelog/main/changelog/template.rst")
md5sums=('cb876007a8ec3450509fdd09a56ee34c'
         'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t changelog ${srcdir}/template.rst
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
#   pytest #|| warning "Tests failed"
}

package_python-sphinx-changelog() {
    depends=('python-sphinx' 'towncrier>=21.3.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sphinx-changelog-doc() {
    pkgdesc="Documentation for sphinx-notfound-page"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
