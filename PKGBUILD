# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-keycloak
pkgver=3.3.0
pkgrel=2
pkgdesc='Python package providing access to the Keycloak API'
arch=('any')
url='https://github.com/marcospereirampj/python-keycloak'
license=('MIT')
depends=('python' 'python-requests' 'python-requests-toolbelt' 'python-jose' 'python-urllib3' 'python-deprecation')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/marcospereirampj/python-keycloak/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('908ece3caf99b067185a7c33f5773938b8da3d895c94b68fa7ba62c7c0e34ef5')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Drop global files which can conflict
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  rm "${pkgdir}/usr/lib/python${python_version}/site-packages/CONTRIBUTING.md"
  rm "${pkgdir}/usr/lib/python${python_version}/site-packages/LICENSE"
  rm "${pkgdir}/usr/lib/python${python_version}/site-packages/CHANGELOG.md"
}

check() {
  cd "${pkgname}-$pkgver"

  # requires: python-httmock
#python3 setup.py test
}
