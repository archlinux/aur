# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darker
pkgver=1.7.2
pkgrel=1
pkgdesc='Apply black reformatting to Python files only in regions changed since a given commit'
arch=('any')
url=https://github.com/akaihola/darker
license=('BSD')
depends=('python'
         'python-black'
         'python-toml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-kwparametrize'
              'git'
              'python-regex'
              'python-pygments'
              'python-flynt'
              'python-isort')
optdepends=('python-isort: for sorting import statements'
            'python-pygments: terminal syntax highlighting'
            'python-flynt: convert string literals to f-strings')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/akaihola/darker/releases/download/${pkgver}/darker-${pkgver}.tar.gz"
        "flynt-0-78-compatibility.patch::${url}/pull/480.patch")
sha512sums=('bbe1a53a2fedd2c1444a1db92ae392f1dad25a1275492e4025548966f20803184a17005e278b5190630ef1f697f6d03e2309a3d40583eada75604bd97e6d69aa'
            '6c6574774e0da26fce4db492b7fb032c30fc153c63f04d30c0394f7fd99237e9349212f27d3e7d0a5bbfc5809bf070aca09b68ecdfc3f4e39bc16ca6fd44898a')

prepare() {
  cd "darker-${pkgver}"
  patch -Np1 -i "${srcdir}/flynt-0-78-compatibility.patch"
}

build() {
  cd "darker-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "darker-${pkgver}"
  # override XDG_CONFIG_HOME to avoid global black config breaking tests
  XDG_CONFIG_HOME="$pkgdir" PYTHONPATH="$PWD/build/lib:${PYTHONPATH}" python -m pytest -k 'not test_fstring_importable_with_and_without_flynt'
}

package() {
  cd "darker-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
