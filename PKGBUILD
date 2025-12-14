# Maintainer: Maud Spierings <maud_spierings@hotmail.com>

pkgname=python-libuuu
pkgver=1.5.233
pkgrel=1
pkgdesc='A python wrapper for libuuu'
arch=('x86_64' 'aarch64')
url='https://github.com/nxp-imx/mfgtools'
license=(BSD-3-Clause)
depends=('bzip2' 'zlib' 'libusb' 'libzip' 'openssl' 'tinyxml2' 'python-setuptools-scm')
makedepends=('meson' 'git' 'cmake' 'python-build' 'python-installer' 'python-wheel' 'zip' 'unzip')
changelog=History.md
source=(
	"git+$url#commit=79ce7d2b2e7459e7b7c94f902d172c30b08884ab" # 1.5.233
	"git+https://github.com/microsoft/vcpkg.git"
)
sha256sums=('8902c79ea91e30a91bb28bda2b4b34cb19f3a7e90ff2183623ad1acec3e3310f'
            'SKIP')

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
	python -m installer --destdir="${pkgdir}" dist/libuuu-${pkgver}-py3-none-linux_${CARCH}.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

