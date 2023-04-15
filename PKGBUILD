# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >

pkgname="python-parsy-git"
_pkgname=${pkgname%-git}
pkgver=2.1
pkgrel=1
pkgdesc="Easy and elegant parser combinators for Python. With awesome docs"
arch=('any')
url="https://github.com/python-parsy/parsy"
license=('MIT')
depends=("python")
makedepends=('python-setuptools')
# checkdepends=("python-pytest")
source=("${pkgname}::git+${url}#branch=master")
sha512sums=('SKIP')

_get_tag() {
    git tag --list | grep '^v' --color=never | tail -n1
}

prepare() {
    cd "${pkgname}"

    git reset --hard "$(_get_tag)"
}

pkgver() {
    cd "${pkgname}"
    _get_tag | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"

    python3 setup.py build
}

# https://github.com/python-parsy/parsy/pull/73
# check() {
#     pytest "${pkgname}"
# }

package() {
    cd "${pkgname}"

    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
    install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
