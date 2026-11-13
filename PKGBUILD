# Maintainer: jskier
_name=scm_python
pkgname=python-scm-python
pkgver=0.0.1b3
pkgrel=1
pkgdesc='Official Palo Alto Networks Strata Cloud Manager (SCM) Python SDK (beta)'
arch=('any')
url='https://github.com/PaloAltoNetworks/scm-python'
license=('Apache-2.0')
depends=(
  'python'
  'python-dateutil'
  'python-oauthlib'
  'python-pydantic'
  'python-requests-oauthlib'
  'python-typing_extensions'
  'python-urllib3'
)
makedepends=('python-build' 'python-installer' 'python-setuptools')
# Installs the top-level "scm" module, same as the archived pan-scm-sdk
conflicts=('python-pan-scm-sdk')
source=("https://files.pythonhosted.org/packages/source/s/scm-python/${_name}-${pkgver}.tar.gz")
sha256sums=('b0e113e38fc1e16a304b309840db5d34124322bf9a53e6743b5282c4ec30c3a0')

prepare() {
  cd "${_name}-${pkgver}"
  # Upstream caps urllib3 below 2.1.0; Arch ships a newer 2.x. Drop the cap.
  sed -i 's/"urllib3 >= 1.25.3, < 2.1.0"/"urllib3 >= 1.25.3"/' pyproject.toml
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
