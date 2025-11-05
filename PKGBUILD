# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: redfish <redfish@galactica.pw>
_base=coincurve
pkgname=python-${_base}
pkgver=21.0.0
pkgrel=3
pkgdesc="Cross-platform Python CFFI bindings for libsecp256k1"
arch=(x86_64)
url="https://github.com/ofek/${_base}"
license=(Apache-2.0 MIT)
depends=(python libsecp256k1)
makedepends=(python-build python-installer python-hatchling python-wheel python-scikit-build-core python-cffi)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  rid-setuptools.patch::${url}/pull/207.patch
  cffi-license-files.patch::${url}/pull/188.patch)
sha512sums=('19f8ab584513653cb0b05d08db8abf86b7bab34878f047423c0217ffb996e757dc1ab37dbb194cf5eada42853cd622cabb181ff6cbb4c50b550bb189a8651f42'
            '9357c45758f011e7ea23c0126b1b5b160fa852a39227eed357b7b019108134f8fe34c53ac1ef78bcca766d23b4ad07d5029902e93413361d55d5e8d5d2ce1c1b'
            '854ec662bd40be9b29e06be850884c961b2b7a793deb48f5eb8468460a3da6bb5a610f91d0fffb2f435774ce6235bd85823a6abdc015445018aea69541241ecd')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../rid-setuptools.patch
  patch -p1 -i ../cffi-license-files.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
