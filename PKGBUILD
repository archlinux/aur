# Maintainer: you <you@example.com>
pkgname=aegis-tools-git
_pkgname=aegis-tools
pkgver=0.3.5.r49.gf670b2e
pkgrel=1
pkgdesc='Developer tools for Aegis Authenticator (decrypt-vault, gen-vault, gen-icons, gen-qr)'
arch=('any')
url='https://github.com/alexbakker/aegis-tools'
license=('GPL-3.0-only')
depends=(
  'python'
  'python-cryptography'
  'python-lxml'
  'python-qrcode'
  'python-reportlab'
  'python-svglib'
  'python-xmltodict'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  _ver=$(sed -n 's/^__version__ = "\(.*\)"/\1/p' setup.py)
  printf '%s.r%s.g%s' "${_ver}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
