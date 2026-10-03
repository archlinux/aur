# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="imfing"
_appname="jsrun"

pkgname="python-${_appname}"
pkgver=0.3.0
pkgrel=1
pkgdesc="Modern JavaScript runtime in Python, powered by V8 and bridged by Rust"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')

arch=('x86_64' 'aarch64')
_barch=('cp310-abi3-manylinux_2_28_x86_64' 'cp310-abi3-manylinux_2_28_aarch64')

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
sha256sums=('d176bcdb0b79ee7fbaf87b59c080f97dad73f887000768630515fc068882db55'
            '010b9cc868c2bebbed7c50f88682d275bea3bda6e8e799a84aa9c7551db52491')
sha256sums_x86_64=('bcde8ac39f220590b4ccb6026e97d81cb01151857cc5737f21bfdd5d712f5fb5')
sha256sums_aarch64=('53820305ee8a582485750fa4c3a451aff2d0aab282b773e49b804bf819392108')

noextract=("${source_x86_64[@]##*/}" "${source_aarch64[@]##*/}")


package() {
	cd "${srcdir}/"

	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps *.whl

	python -O -m compileall "${pkgdir}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
