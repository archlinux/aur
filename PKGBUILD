# Maintainer: Edoardo Signorini <contact at edoars dot me>

_pyname=citerus
_pkgname="python-${_pyname}"
pkgname="${_pkgname}-git"
pkgver=r5.5262430
pkgrel=1
pkgdesc='CLI util to retrieve cryptobib citations'
arch=(any)
url=https://github.com/matteocam/citerus
license=(MIT)
depends=(python python-gitpython python-pyperclip python-rich python-textual)
makedepends=(git python-setuptools python-wheel python-build python-installer)
provides=("${_pkgname}=${pkgver}" "${_pyname}=${pkgver}" "${_pyname}-git=${pkgver}")
conflicts=("${_pkgname}" "${_pyname}")
source+=(git+https://github.com/matteocam/citerus)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pyname}"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	git -C "${srcdir}/${_pyname}" clean -dfx
}

build() {
	cp "${srcdir}/${_pyname}/LICENSE" "${srcdir}/LICENSE"

	cd "${srcdir}/${_pyname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pyname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
