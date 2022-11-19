# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Erol V. Aktay <e.aktay@gmail.com>

pkgname=python38-html5lib
pkgver=1.1
pkgrel=11
arch=('any')
url="https://github.com/html5lib"
license=('MIT')
pkgdesc="A Python HTML parser/tokenizer based on the WHATWG HTML5 spec"
_deps=('six' 'webencodings')
depends=("${_deps[@]/#/python38-}")
makedepends=('python38-setuptools' "${_deps[@]/#/python38-}")
_checkdeps=('pytest' 'pytest-expect' 'mock')
checkdepends=("${_checkdeps[@]/#/python38-}" 'python38-lxml')
optdepends=('python38-lxml: lxml treebuilder'
            'python38-genshi: genshi treewalker')
_test_commit=71eebd59772d1d39aced0c0582ae9c09acf3ce6e
source=("$pkgname-$pkgver.tar.gz::https://github.com/html5lib/html5lib-python/archive/${pkgver}.tar.gz"
        "https://github.com/html5lib/html5lib-python/commit/2c19b9899ab3a3e8bd0ca35e5d78544334204169.patch"
        "https://github.com/html5lib/html5lib-tests/archive/${_test_commit}.tar.gz")
sha256sums=('66e9e24a53c10c27abb6be8a3cf2cf55824c6ea1cef8570a633cb223ec46e894'
            '6f37b33667e35ea138279be9842f012792821b1497b81ae4b108a74180cfe249'
            'c866f5e4ae9ef34313e2b61fcb74849b6f8aef970bf8249956b6a5d142197087')

prepare() {
    cd "${srcdir}"/html5lib-python38-${pkgver}

    # fix pytest 6 compat
    patch -p1 -i ../2c19b9899ab3a3e8bd0ca35e5d78544334204169.patch

    rmdir html5lib/tests/testdata
    ln -sfT ../../../html5lib-tests-${_test_commit} html5lib/tests/testdata
}

build() {
    cd "${srcdir}"/html5lib-python38-${pkgver}

    python3.8 setup.py build
}

check() {
    cd "${srcdir}"/html5lib-python38-${pkgver}

    py.test
}

package() {
    cd "${srcdir}"/html5lib-python38-${pkgver}

    python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
