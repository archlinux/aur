# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="imfing"
_appname="jsrun"

pkgname="python-${_appname}"
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern JavaScript runtime in Python, powered by V8 and bridged by Rust"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')

arch=('x86_64' 'aarch64')
_barch=('cp314-cp314-manylinux_2_28_x86_64' 'cp314-cp314-manylinux_2_28_aarch64')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
__url_github_raw="https://raw.githubusercontent.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-maturin' 'python-hatchling')
depends=('glibc' 'libgcc' 'python')

source=("README-${pkgver}.md::${__url_github_raw}/v${pkgver}/README.md"
		"LICENSE-${pkgver}::${__url_github_raw}/v${pkgver}/LICENSE")
source_x86_64=("${_url_github}/releases/download/v${pkgver}/${_appname}-${pkgver}-${_barch[0]}.whl")
source_aarch64=("${_url_github}/releases/download/v${pkgver}/${_appname}-${pkgver}-${_barch[1]}.whl")
sha256sums=('61ee6dcccc9f526585d7e8863ccdf0134889276afb04a8e824f6ecdaba594ddc'
            '010b9cc868c2bebbed7c50f88682d275bea3bda6e8e799a84aa9c7551db52491')
sha256sums_x86_64=('a524f336e1a21545e584586e48714400cbbe975ebb09960fae6290211bc3cce0')
sha256sums_aarch64=('a3f0299c6e38c043108e3ed6796195ac0bcb2a195671602c2f76f7914a4906c5')

noextract=("${source_x86_64[@]##*/}" "${source_aarch64[@]##*/}")


package() {
	cd "${srcdir}/"

	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps *.whl

	python -O -m compileall "${pkgdir}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
