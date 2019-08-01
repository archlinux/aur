# Maintainer: Utkan Güngördü <utkan@freeconsole.org>

pkgname=waifu2x-ncnn-vulkan-git
_pkgname=waifu2x-ncnn-vulkan
pkgver=20190712.r3.gc11d4f4
pkgrel=1
pkgdesc="waifu2x converter ncnn version, runs fast on intel / amd / nvidia GPU with vulkan"
url="https://github.com/nihui/waifu2x-ncnn-vulkan"
license=('MIT')
depends=('ncnn-git')
makedepends=('git' 'cmake')
conflicts=('waifu2x-ncnn-vulkan')
provides=('waifu2x-ncnn-vulkan')
arch=('i686' 'x86_64')
source=("git://github.com/nihui/waifu2x-ncnn-vulkan.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/waifu2x-ncnn-vulkan"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/waifu2x-ncnn-vulkan/src"
	sed -ie 's/set(ncnn_DIR "\/home\/nihui\/dev\/ncnn\/build\/install\/lib\/cmake\/ncnn")/include_directories("\/usr\/include\/ncnn")/' CMakeLists.txt
	sed -ie 's/find_package(ncnn REQUIRED)/#find_package(ncnn REQUIRED)/' CMakeLists.txt
}

build() {
	cd "${srcdir}/waifu2x-ncnn-vulkan/src"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr ..
	make
}

package() {
	cd "${srcdir}/waifu2x-ncnn-vulkan/src"
	install -Dm755 "build/waifu2x-ncnn-vulkan" "${pkgdir}/usr/bin/waifu2x-ncnn-vulkan"
        for f in ../models/models-cunet/*; do
                install -Dm 644 "$f" ${pkgdir}/usr/share/waifu2x-ncnn-vulkan/"$f"
        done
	for f in ../models/models-upconv_7_anime_style_art_rgb/*; do
		install -Dm 644 "$f" ${pkgdir}/usr/share/waifu2x-ncnn-vulkan/"$f"
	done
}
