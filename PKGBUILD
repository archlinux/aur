# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Michal Wojdyla <micwoj9292@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Achmad Fathoni <fathoni.id(at)gmail.com>

_pkgname='beartype'
pkgname="python-${_pkgname}"
pkgver=0.22.9
pkgrel=2
pkgdesc='Unbearably fast near-real-time hybrid runtime-static type-checking in pure Python'
arch=('any')
url="https://github.com/beartype/${_pkgname}"
license=('MIT')
depends=('python>=3.10')
makedepends=(
	'python-build'
	'python-hatchling'
	'python-installer'
	'python-wheel'
)
checkdepends=(
	'python-pytest'
	'python-numpy'
	'python-xarray'
	'python-click'
	'python-rich-click'
	'python-pygments'
	'python-typing_extensions'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	'numpy-2.5-backport.patch'
	'ee167cf-idempotence-backport.patch'
)
b2sums=(
	'a5433abbf101609fb40644951f39f326fc177dcf75160064e602478e1a5aec41b0c16317fb7172e2500bdf1d81b964ac1c23113a37aed51f8e4ab88c896b2694'
	'd7580f1a8df0311d32132dadc2f7549902e9fe5f9d1419fcbc9b19199175a5011349331860f9171a9c1772788ff387bbfe61b360400dee72e3792741c0aea266'
	'64f2ceb9a2544db5a4ff1c72a683e6c60037bd43c0444d9827554b42a1fc8f5e023beb42f5d9ad2278e832e3cff7c66064dab0a16ccea9cea5b4db076196bcfe'
)

prepare() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	patch -Np1 -i "${srcdir}/numpy-2.5-backport.patch"
	patch -Np1 -i "${srcdir}/ee167cf-idempotence-backport.patch"
}

build() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	rm -rf -- "${srcdir}/test-install"

	python -m installer --destdir="${srcdir}/test-install" dist/*.whl

	local site_packages=("${srcdir}/test-install"/usr/lib/python*/site-packages)
	if (( ${#site_packages[@]} != 1 )) || [[ ! -d "${site_packages[0]}" ]]; then
		printf 'Expected exactly one installed site-packages directory, got %s\n' "${#site_packages[@]}" >&2
		return 1
	fi

	PYTHONPATH="${site_packages[0]}" pytest \
		--deselect 'beartype_test/a90_func/pep/test_pep561_static.py' \
		--deselect 'beartype_test/a90_func/a40_claw/external/test_claw_fastmcp.py::test_claw_fastmcp' \
		-p asyncio
}

package() {
	cd -- "${srcdir}/${_pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
