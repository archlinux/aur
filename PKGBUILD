# Maintainer: KorespondentAda <0kononov0 at gmail dot com>
_pkgname="boosty_downloader"
pkgname="boosty-downloader"
pkgver=2.1.1
pkgrel=1
pkgdesc="Download any type of content from boosty.to"
arch=(any)
url="https://github.com/Glitchy-Sheep/boosty-downloader"
license=('MIT')
groups=()
depends=(
	# Listed in pyproject.toml
	'python>=3.10'
	#'asyncio>=3.4.3' Provided by `python` itself
	'python-aiofiles>=24.1.0-2'
	'python-aiohttp>=3.11.12-1'
	'python-pydantic>=2.10.6-1'
	'python-rich>=14.0.0-1'
	'python-pydantic-settings>=2.7.1-1'
	'python-pyyaml'
	'python-typer>=0.16.0-1'
	'yt-dlp>=2025.1.26-1'
	'python-jinja>=1:3.1.5-1'
	'python-aiohttp-retry>=2.9.1-1'
	'python-yarl>=1.18.3-1'
	'python-aiolimiter>=1.2.1'
	'python-sqlalchemy>=2.0.42'
	'python-packaging>=25.0'
)
makedepends=(
	'python-build' 'python-installer'
	'python-wheel' 'python-setuptools'
)
checkdepends=(
	'python-poetry'
	'python-pytest>=1:8.4.1-1'
)
provides=("${pkgname}" "${_pkgname}")
conflicts=("${pkgname}" "${_pkgname}")
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/Glitchy-Sheep/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('d8dbf181a2d6a83d623045ff789c20ff5a7792ff10cb69b9e3564f2c3f8397fe')

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	# Project itself provides `build` target, but it's supposed to
	# build release package for PyPi
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/${pkgname}-$pkgver"
	# Setting PYTHONPATH for test suite so it can find built project
	PYTHONPATH="$(pwd):$PYTHONPATH" make test
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

