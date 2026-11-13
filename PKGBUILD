# Maintainer: jskier
_name=pan_scm_sdk
pkgname=python-pan-scm-sdk
pkgver=0.15.1
pkgrel=1
pkgdesc='Python SDK for Palo Alto Networks Strata Cloud Manager (SCM)'
arch=('any')
url='https://github.com/cdot65/pan-scm-sdk'
license=('Apache-2.0')
depends=(
  'python'
  'python-cryptography'
  'python-oauthlib'
  'python-pydantic'
  'python-pyjwt'
  'python-requests-oauthlib'
)
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/p/pan-scm-sdk/${_name}-${pkgver}.tar.gz")
sha256sums=('52df0010f1704c62de68759424dfe8676bb334675d47fb54d5926a535b7608a5')

prepare() {
  cd "${_name}-${pkgver}"
  # Upstream pins are stricter than Arch's rolling versions; relax them.
  # setuptools is not needed at runtime; cryptography upper bound dropped.
  sed -i -e '/^setuptools = /d' -e 's/^cryptography = .*/cryptography = ">=49.0.0"/' pyproject.toml
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
