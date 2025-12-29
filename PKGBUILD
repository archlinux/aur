# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-ink-extensions
_gitpkgname=ink_extensions
pkgver=2.2.0
pkgrel=1
pkgdesc='Python dependencies for running Inkscape extensions outside of Inkscape'
arch=('any')
url='https://github.com/evil-mad/ink_extensions'
license=('GPL-2.0-only')
depends=('python' 'python-lxml')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-mock' 'python-pytest')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/evil-mad/ink_extensions/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '3ece4ed7a4ffda655d5e6bd1a11c9934cbd2e44c843161eeeefe4e8fa63a090c8fa1a98e79c178746c4a792d697e95e1ee5eac8cf05a93e8754e8cafd33d497c'
)

build() {
  cd "${_gitpkgname}-${pkgver}"
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

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
