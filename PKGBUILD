# Maintainer: Maud Spierings <maud_spierings@hotmail.com>

pkgname=python-libuuu
pkgver=1.5.244
pkgrel=1
pkgdesc='A python wrapper for libuuu'
arch=('x86_64' 'aarch64')
url='https://github.com/nxp-imx/mfgtools'
license=(BSD-3-Clause)
depends=('bzip2' 'zlib' 'libusb' 'libzip' 'openssl' 'tinyxml2' 'python-setuptools-scm')
makedepends=('meson' 'git' 'cmake' 'python-build' 'python-installer' 'python-wheel' 'zip' 'unzip')
changelog=History.md
source=(
	"git+$url#commit=230f1b150eb7f9ea906a0138c0e28240a8e2df8f" # 1.5.243
	"git+https://github.com/microsoft/vcpkg.git"
	"git_version.patch"
)
sha256sums=('cc634b159871d6442143f8d0eb2760155344f4e337039cb703dd4434baebd9d7'
            'SKIP'
            '4f60aa6025bdc9feb2dca432ee94c12e9750f7f52891f0dee383e0372be8fa77')

prepare() {
  patch --directory="mfgtools" --forward --strip=1 --input="${srcdir}/git_version.patch"
}

build() {
	export VCPKG_FORCE_SYSTEM_BINARIES=1
	cd "${srcdir}"

	export VCPKG_ROOT="${srcdir}/vcpkg"
	$VCPKG_ROOT/bootstrap-vcpkg.sh -disableMetrics

	cd mfgtools/wrapper
	cmake \
		--preset unix \
		-B build \
		-DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
	cmake --build build
	mkdir -p libuuu/lib
	cp build/libuuu.so libuuu/lib
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/mfgtools/wrapper"
	python -m installer --destdir="${pkgdir}" dist/libuuu-${pkgver}.dev0-py3-none-linux_${CARCH}.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

