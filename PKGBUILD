pkgname=msvc-wine-git
pkgver=16.11.7
pkgrel=3
pkgdesc='MSVC compiler with CMake toolchains. Compiler work in Wine64'
arch=('x86_64')
url='https://github.com/mstorsjo/msvc-wine'
license=(EULA)
depends=(wine cmake)
makedepends=(git sed python python-simplejson python-six msitools)
provides=(msvc-x86-cmake msvc-x64-cmake msvc-arm-cmake msvc-arm64-cmake)
conflicts=(msvc-wine msvc-wine-git)
source=('git+https://github.com/mstorsjo/msvc-wine.git'
		'msvc-cmake.sh'
		'toolchain-msvc.cmake')
sha256sums=('SKIP'
			'8629fdbc948fa42640ac93388316b776e9c51e9cd5ff05be9506e96547b98e59'
			'52efc3ad1f5575f35cf9319ade41a23ace667156bdc5f66e4e32527bc8b64c5d')
options=('!strip' 'libtool' 'staticlibs' 'emptydirs')

_architectures="x86 x64 arm arm64"

pkgver() {
	VS_VERSION=`python msvc-wine/vsdownload.py --print-version | grep "Loaded installer manifest for "`
	echo -n ${VS_VERSION:30}
}

prepare() {
	for _arch in ${_architectures}; do
		sed "s|@PROCESSOR@|${_arch}|g" toolchain-msvc.cmake > toolchain-${_arch}.cmake
		sed "s|@PROCESSOR@|${_arch}|g" msvc-cmake.sh > msvc-${_arch}-cmake
	done
}

build() {
	cd msvc-wine
	mkdir -p "${srcdir}/../cache"
	python vsdownload.py --accept-license --dest "${srcdir}/msvc" --cache "${srcdir}/../cache"
	sh install.sh "${srcdir}/msvc"
	cd -
}

package() {
	for _arch in ${_architectures}; do
		cat "${srcdir}/msvc/bin/${_arch}/msvcenv.sh" | sed 's/BASE=.*/BASE='z:\\\\\\\\opt\\\\\\\\msvc/ > "${srcdir}/msvc/bin/${_arch}/msvcenv.sh.patched"
		cat "${srcdir}/msvc/bin/${_arch}/msvcenv.sh.patched" | sed 's/BASE_UNIX=.*/BASE_UNIX='\\/opt\\/msvc/ > "${srcdir}/msvc/bin/${_arch}/msvcenv.sh"
		rm "${srcdir}/msvc/bin/${_arch}/msvcenv.sh.patched"
	done
	
	mkdir -p "${pkgdir}/opt/msvc"
	mv "${srcdir}/msvc" "${pkgdir}/opt/msvc"
	
	mkdir -p "${pkgdir}/usr/bin"
	
	for _arch in ${_architectures}; do
		mkdir -p "${pkgdir}/opt/msvc/cmake/find_root/${_arch}"
		mv "${srcdir}/toolchain-${_arch}.cmake" "${pkgdir}/opt/msvc/cmake/toolchain-${_arch}.cmake"
		mv "${srcdir}/msvc-${_arch}-cmake" "${pkgdir}/usr/bin/msvc-${_arch}-cmake"
		chmod 755 "${pkgdir}/usr/bin/msvc-${_arch}-cmake"
	done
}
