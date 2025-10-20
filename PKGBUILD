# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgname=valve-parsers

pkgname="python-${_pkgname}-git"
pkgver=1.0.7
pkgrel=1

pkgdesc='Some parsers for Valve game files - written in python.'
arch=('x86_64')
url='https://github.com/cueki/valve-parsers'
license=('MIT')

depends=('python>=3.8')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')

source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	python -c "$(printf '%s\n' \
		'import sys, pathlib' \
		'try: import tomllib as toml' \
		'except ModuleNotFoundError: import tomli as toml' \
		'print(toml.loads(pathlib.Path(f"{sys.argv[1]}/pyproject.toml").read_text(encoding="utf-8")).get("project",{}).get("version"))')" "${_pkgname}"
}

prepare() {
	git -C "${_pkgname}" clean -dfx # Clean out old wheels etc.
}

build() {
	cd "${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
