# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributer Anton Kalmykov <anton dot kalmykov at gmail dot com>

_basename=airwave
pkgname=${_basename}-git
pkgver=r155.8cd3507
pkgrel=3
pkgdesc="Airwave is a WINE-based VST bridge, that allows for the use of Windows 32- and 64-bit VST 2.4 audio plugins with Linux VST hosts"
arch=("i686" "x86_64")
license=("MIT")
url="https://github.com/phantom-code/airwave"
depends=("wine>=1.7" "qt5-base" "steinberg-vst36")
makedepends=("git" "cmake>=2.8")

if [[ $CARCH == "x86_64" ]]; then
	makedepends+=("gcc-multilib")
fi

provides=("airwave")
conflicts=("airwave")

source=("git+https://github.com/phantom-code/airwave.git#branch=master")

sha256sums=('SKIP')

pkgver()
{
	cd "${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${_basename}"

	if [[ -d build ]]; then
		rm -rf build
	fi

	mkdir -p build && cd build

	cmake -DCMAKE_INSTALL_PREFIX="/usr"       \
		  -DCMAKE_BUILD_TYPE="Release"        \
		  -DVSTSDK_PATH="/usr/include/vst36" ..
	make
}

package()
{
	cd "${_basename}/build"
	make install DESTDIR="${pkgdir}/"

	# Install the documentation
	install -D -m644 "${srcdir}/${_basename}/README" \
					 "${pkgdir}/usr/share/doc/${_basename}/README"

	# Install the license
	install -D -m644 "${srcdir}/${_basename}/LICENSE" \
					 "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
