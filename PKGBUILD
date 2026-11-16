# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Raz <real.raz.dev@gmail.com>

_name=raztint
pkgname="python-${_name}"
pkgver=0.10.0
pkgrel=1
pkgdesc="A zero-dependency Python library for ANSI coloring and smart CLI icons"
url="https://github.com/razbuild/${_name}"
arch=('any')
license=('MIT')
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-uv-build' 'python-hatchling' 'python-build' 'python-installer' 'python-wheel')
provides=('python-raztint')
conflicts=('python-raztint')
options=('!emptydirs')

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  'uv_build-fix.patch'
)
sha256sums=('1bc04b8b87d8de32844c542c09eec4a932256c875df4e54d112558865d35517a'
            '19c497c9b625d9ac04f5f14f53ba47dee2e5a06399eb42650a7a4b2323ecdbd7')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  patch -p1 -F0 --binary -i "${srcdir}/uv_build-fix.patch"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest tests
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

