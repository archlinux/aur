# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkgname=pytoml
pkgname=python-pytoml
pkgver=0.1.21
_test_commit=bbfef3b9277eac47e5d6e9e507c99f0a40a61f8a
pkgrel=8
pkgdesc="A TOML-0.4.0 parser/writer for Python."
arch=('any')
url="https://github.com/avakar/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://github.com/avakar/toml-test/archive/${_test_commit}.tar.gz")
sha512sums=('6e261e7f979b7beb835061a90d098036b968b9f2e5b4ef74302e7bf59b49651d92e32fb0488831c0bc1325f14a2512e0b7681e8e2bbf59804835179812203875'
            '83264fdeb90c8dde3552631569a39252273910ec39cabb5a220c3ef47a40c5f2c4e506c1cbaf4e863cd6e80e38ef7e816df607d95389e66ed3406efff18b802b')
b2sums=('9c07a9e7ba0121b03e1fada1961b5123bf66e89ae9ef129bd6bf0a313e71e7fbf29479cf7f1e7659bdc35e483b41e38ceefc3854f690eeaee4aebe704b6a6b3c'
        '1b4b58467365d5afc9d397aae2939aed182764a177bd2fb66732d591f2ec6872205c74dd5c8162f00d0d008faef0bb8da661049cadb2d0fd1ba415708ee932ea')

prepare() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    rm -rf test/toml-test
    ln -sf "${srcdir}"/toml-test-${_test_commit} test/toml-test
}

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python -m pytest
    PYTHONPATH=$PWD python test/test.py
}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
