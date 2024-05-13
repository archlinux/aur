# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-autoimport
_pkgname="${pkgname#python-}"
pkgver=1.5.0
pkgrel=1
pkgdesc='Autoimport automatically fixes wrong import statements'
arch=('any')
url=https://github.com/lyz-code/autoimport
license=('GPL3')
depends=('python'
	'python-autoflake'
	'python-click'
	'python-maison'
	'python-pyflakes'
	'python-pyprojroot'
	'python-sh'
	'python-xdg-base-dirs')
checkdepends=(
	"python-pytest"
	"python-pytest-xdist"
	"python-pytest-freezegun"
	"python-xdg-base-dirs"
)
makedepends=('python-build' 'python-installer' 'python-pdm' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lyz-code/autoimport/archive/refs/tags/${pkgver}.tar.gz"
	"xdg-base-dirs.patch")
sha512sums=('ecd2a3cf32f2fb8e29140cc0cec8dac378224e2b4f70029e96976d9f28353557c273d82a7d43d02b0dc34ee3c2a3d32b1a73f5df8859df21f8f91ba10bb36fe2'
            '2ba4a709f02a5aaf02c5acefddf0d4ed7b73c5249ad63700a71a0694a54fcc4593af6cefa03c9532026cab9980f864f8d1bfdd5b693168d5a465bde3c1f16ce1')

prepare() {
	cd "${_pkgname}-${pkgver}"
	# manually patch xdg->xdg-base-dirs because this issue marked 'wontfix': https://github.com/lyz-code/autoimport/issues/239
	patch -Np1 -i "${srcdir}/xdg-base-dirs.patch"
}

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	python3 -m venv --system-site-packages "${srcdir}/testing-venv"

	cd "${_pkgname}-${pkgver}"
	"${srcdir}/testing-venv/bin/python" -m pip install --no-deps .

	# TODO: these 2 tests seem to fail when the proj directory name does not equal the package name
	"${srcdir}/testing-venv/bin/python" -m pytest \
		-k 'not (test_fix_autoimports_objects_defined_in_the_root_of_the_package or test_fix_autoimports_objects_defined_in___all__special_variable)'
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md" "CHANGELOG.md"
}
