# Maintainer: Michael Gates <michael at belowthesalt . us>
pkgname=python-pan-python
_name=pan-python
_altname=pan_python
pkgver=0.26.0
pkgrel=1
pkgdesc="Multi-tool set for Palo Alto Networks PAN-OS, Panorama, WildFire and AutoFocus"
arch=('any')
url="https://github.com/kevinsteves/${_name}"
license=('ISC')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

# wfapi uses certifi's CA bundle instead of the system store if
# certifi is installed (likely) and ssl_context is None (default).
# Behind TLS decryption, pass your own ssl_context (e.g., /etc/ssl/certs).
optdepends=('python-requests: HTTP backend used automatically if present (else urllib)'
            'python-certifi: CA bundle for WildFire API certificate verification (overrides system CA store)')
source=("${_name}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_altname}-${pkgver}.tar.gz")
sha256sums=('0a0ea34279b745e8e3d55df015e18ab299051ffdd519128d9340ff7aae4e2392')

build() {
  cd "${_altname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_altname}-${pkgver}"
  python -m installer --destdir=test_dir dist/*.whl
  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/${site_packages}" python -c "import pan.xapi, pan.licapi, pan.wfapi, pan.afapi; print('Import check passed')"
}

package() {
  cd "${_altname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
