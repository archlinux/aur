# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Grey Christoforo <first name at last name dot net>

_pkgname='tesserocr'
pkgname="python-${_pkgname}"
pkgver='2.12.0'
pkgrel=1
pkgdesc='A simple, Pillow-friendly, Python wrapper around tesseract-ocr API using Cython'
arch=('x86_64')
url="https://github.com/sirfz/${_pkgname}"
license=('MIT')
depends=(
	'leptonica'
	'python'
	'tesseract'
	'tesseract-data-eng'
)
makedepends=(
	'cython>=3.1.8'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=(
	'python-pillow'
	'tesseract-data-osd'
)
optdepends=('python-pillow: support PIL.Image objects')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('af93a9e26a06726dfe9c427dc7c0c6c1c075cd703b1651f7ba02c3bd95ef68b52f029d827be83c7c3a61280ca323b33ae2280181fbca5f0b6d996e85cc4fdf80')

build() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

_select_wheel() {
	local _wheels=(dist/"${_pkgname}-${pkgver}"-*.whl)
	if (( ${#_wheels[@]} != 1 )) || [[ ! -f "${_wheels[0]}" ]]; then
		printf 'Expected exactly one wheel for %s %s\n' "${_pkgname}" "${pkgver}" >&2
		return 1
	fi
	printf '%s\n' "${_wheels[0]}"
}

check() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	local _wheel
	_wheel="$(_select_wheel)" || return 1
	local _check_dir
	_check_dir="$(mktemp -d -- "${srcdir}/_check.XXXXXXXX")" || return 1
	(
		trap 'rm -rf -- "${_check_dir}"' EXIT
		bsdtar -xf "${_wheel}" -C "${_check_dir}" || exit 1
		cp -a -- tests "${_check_dir}/tests" || exit 1
		cd -- "${_check_dir}" || exit 1
		OMP_THREAD_LIMIT=1 python -m unittest discover -v
	)
}

package() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	local _wheel
	_wheel="$(_select_wheel)" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 0 --compile-bytecode 2 "${_wheel}"
	install -D -m644 -- LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
