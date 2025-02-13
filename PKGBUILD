# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-pysdl3
pkgver=0.9.4b2
pkgrel=2
pkgdesc="Python ctypes wrapper around SDL3"
arch=("x86_64")
url="https://github.com/Aermoss/PySDL3"
license=("MIT")
depends=(
	"alsa-lib"
	"freetype2"
	"python-aiohttp"
	"python-packaging"
	"python-requests"
	"sdl3")
makedepends=(
	"git"
	"python-build"
	"python-installer")
optdepends=(
#	"sdl3_gfx"
	"sdl3_image"
#	"sdl3_mixer"
#	"sdl3_ttf"
	)
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aermoss/PySDL3/archive/refs/tags/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}::git+https://github.com/Aermoss/PySDL3.git#tag=v${pkgver}")
sha256sums=('77857fb1dcce794c3d4170129f7b3f20e1c0675976f5f666bc519c1358bee0ab')


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
	cp -r sdl3/__doc__.py "${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/sdl3/"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
