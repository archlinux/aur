# Maintainer: Zosoled
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: redfish <redfish@galactica.pw>


pkgname='python-coincurve-git'
_pkgname=${pkgname%-git}
_name=${_pkgname#python-}
pkgver=v16.0.0.r125.7829b29
pkgrel=1
pkgdesc='Safest and fastest Python library for secp256k1 elliptic curve operations'

arch=('x86_64')
url="https://github.com/ofek/${_name}"
license=(Apache-2.0 OR MIT)
depends=(libsecp256k1 python)
makedepends=(
	python-build
	python-cffi
	python-hatchling
	python-installer
	python-scikit-build-core
	python-wheel
)
checkdepends=(python-pytest)
provides=(${_pkgname}=${pkgver})
conflicts=(${_pkgname})

source=(
	${_name}::git+${url}
)
sha512sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/${_name}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
build() {
	cd "${srcdir}/${_name}"
	python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
	cd "${srcdir}/${_name}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
