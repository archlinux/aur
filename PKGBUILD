# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-pytest-http-snapshot
_gitpkgname=http-snapshot
pkgver=0.1.9
pkgrel=1
pkgdesc='Pytest plugin that captures and snapshots HTTP roundtrips. Supports httpx and requests.'
arch=('any')
url='https://github.com/karpetrosyan/http-snapshot'
license=('MIT')
depends=(
  'python'
  'python-inline-snapshot'
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-httpx'
  'python-requests'
  'python-urllib3'
)
optdepends=(
  'python-httpx: integration with httpx'
  'python-requests: integration with requests'
  'python-urllib3: integration with requests'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/karpetrosyan/http-snapshot/archive/${pkgver}.tar.gz"
)

sha512sums=(
  '836530661757b20bb2df5da62d89956dd5781f8ca358e1f9974c884fbd751f79e0a5f3c851bbbcb28366995e5300f89b2df21eb19ec7d5a8f0425d588c005cfe'
)

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  pytest
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
