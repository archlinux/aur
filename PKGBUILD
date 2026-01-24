# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

pkgbase=python-click-plugins
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
pkgver=1.1.1.2
pkgrel=1
pkgdesc="An extension module for click to enable registering CLI commands via setuptools entry-points."
arch=("any")
url="https://github.com/click-contrib/click-plugins"
license=("BSD-3-Clause")
depends=("python-click")
makedepends=("python-setuptools")
checkdepends=("python-pytest" "python-click")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-click-8.2-tests.patch')
sha256sums=('d7af3984a99d243c131aa1a828331e7630f4a88a9741fd05c927b204bcf92261'
            'ac640da158003b7cd9eaf237c3ad3c1af14fc6577c8b6a0046513641f414d6f3')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-click-8.2-tests.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
