# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkgname=pytoml
pkgbase=python-pytoml
pkgname=('python-pytoml' 'python2-pytoml')
pkgver=0.1.20
_test_commit=b212790a6b7367489f389411bda009e5ff765f20
pkgrel=1
pkgdesc="A TOML-0.4.0 parser/writer for Python."
arch=('any')
url="https://github.com/avakar/${_pkgname}"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "https://github.com/avakar/toml-test/archive/${_test_commit}.tar.gz")
sha512sums=('9b913219e65e2329302455a1457a39cf5eb37e04c03025dfdbb81db4ffe60b547fb7e64fc961608004900365ccfddb4225042105fa2db8bd2e393fa2797fc24f'
            '94dc6ddadac2c75095b1a9ef7c4f68e38908bfadba53203b75c29c7aa8d3c387c1f05cf9915c2c63eeee869f4290cdcef4b8768cb36dcd4031168b5af549bb54')

prepare() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    rm -rf test/toml-test
    ln -sf "${srcdir}"/toml-test-${_test_commit} test/toml-test
}

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
    python2 setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python -m pytest
    PYTHONPATH=$PWD python test/test.py
    python2 -m pytest
    PYTHONPATH=$PWD python2 test/test.py
}

package_python-pytoml() {
    depends=('python')

    cd "${srcdir}"/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-pytoml() {
    depends=('python2')

    cd "${srcdir}"/${_pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
