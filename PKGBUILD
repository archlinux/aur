# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-pysdl3
pkgver=0.9.3b2
pkgrel=1
pkgdesc="Python ctypes wrapper around SDL3"
arch=("any")
url="https://github.com/Aermoss/PySDL3"
license=("MIT")
depends=(
	"python-aiohttp"
	"python-packaging"
	"python-requests"
	"sdl3")
makedepends=(
	"git"
	"freetype2"
	"python-build"
	"python-installer")
#optdepends=("sdl2_gfx" "sdl2_image" "sdl2_mixer" "sdl2_ttf")
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aermoss/PySDL3/archive/refs/tags/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}::git+https://github.com/Aermoss/PySDL3.git#tag=v${pkgver}")
sha256sums=('36bbaed10245f66e1ea60e9f51b9d5ffa6ccc44106b33283a462a46138ca0a78')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build
	# Generate docs and .so files
	python -c "import sdl3"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	PYTHON_VERSION=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

	python -m installer --destdir="${pkgdir}" dist/*.whl
	cp -r sdl3/bin "${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/sdl3/"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
