# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=plasma5-wallpapers-wallpaper-engine
_pkgname=wallpaper-engine-kde-plugin
pkgver=0.5.4
_pkgver_glslang=11.11.0
pkgrel=5
pkgdesc='A KDE wallpaper plugin integrating wallpaper engine'
arch=('x86_64')
url="https://github.com/catsout/${_pkgname}"
license=('GPL2')
depends=('gst-libav' 'python-websockets' 'plasma-framework5' 'qt5-declarative' 'qt5-websockets')
makedepends=('extra-cmake-modules' 'qt5-webchannel' 'mpv' 'vulkan-headers')
optdepends=('qt5-webchannel: for web support'
	'mpv: alternative video backend')
source=("https://github.com/catsout/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"https://github.com/KhronosGroup/glslang/archive/${_pkgver_glslang}/glslang-${_pkgver_glslang}.tar.gz"
	'fbda175.patch')
sha512sums=('73a0e134430659b457a73e95d8b96b3fd875e44146ec02f5e5662785ecbe8f73a74b642b69a293297e829d6332d7bfba75acaef2c7f6508141d5b60ceadb8e13'
            'c018271d499efff03540e4572a9c2f1f752c81c87efe7f2e63c2631ac47cecfedffdcfee68eddaf9187603eaae8ccd9a3e5640a022ba9fd7d05950f7827bf8cd'
            'c386bde62b16a179f37d82cc2bfc86ee4bcd1f410130ad77aaa207a4a65c2d509b663da34feaf826edebd656d73bde36315f1d89df49cf1a22c016f450655aab')

prepare() {
	mv -T "glslang-${_pkgver_glslang}" "${_pkgname}-${pkgver}/src/backend_scene/third_party/glslang"
	patch -Np1 -d "${_pkgname}-${pkgver}" < 'fbda175.patch'
}

build() {
	cmake -B build -S "${_pkgname}-${pkgver}" \
	  -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
