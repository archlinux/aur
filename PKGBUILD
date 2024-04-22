# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darkgraylib
_pkgname="${pkgname#python-}"
pkgver=1.2.1
pkgrel=1
pkgdesc='Filter linter messages from various Python linters to only those which were caused by recent changes to the code base being linted'
arch=(any)
url="https://github.com/akaihola/darkgraylib"
license=("BSD-3-Clause")
depends=(
	'python'
	'python-toml'
	'python-click'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
	'python-pygments'
	'python-pytest-kwparametrize'
)
optdepends=('python-pygments: syntax highlighting')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('f93150231c79d930a0b66bda2545cbc0f9c51258fb46b51d7464267f5c713526')

build() {
	cd "${pkgname}"
	python -m build --no-isolation
}

check() {
	cd "${pkgname}"
	local site_packages
	[[ ! -d tmp_install ]] || rm -rf tmp_install
	python -m installer -d tmp_install dist/"${_pkgname}-${pkgver}"-*.whl
	site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	export PYTHONPATH="${PWD}/tmp_install/${site_packages}:${PYTHONPATH}"
	pytest -v --import-mode=importlib "src/${_pkgname}"
}

package() {
	cd "${pkgname}"
	python -m installer -d "${pkgdir}" dist/*.whl
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
