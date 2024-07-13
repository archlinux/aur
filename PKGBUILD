# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-citra
pkgname=$_pkgname-git
pkgver=r10151.2d67658e8
pkgrel=1
pkgdesc="Nintendo 3DS core"
arch=('x86_64')
url="https://github.com/libretro/citra"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('crypto++' 'enet' 'gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('boost' 'ffmpeg4.4' 'git' 'zstd')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'citra-dynarmic::git+https://github.com/rtiangha/dynarmic-old.git'
	'citra-soundtouch::git+https://github.com/johnny-mac/ext-soundtouch.git'
	'fmt::git+https://github.com/fmtlib/fmt.git'
	'libretro-nihstro::git+https://github.com/libretro-fork/nihstro.git'
	'lodepng::git+https://github.com/lvandeve/lodepng.git'
	'teakra::git+https://github.com/wwylele/teakra.git'
	'xbyak::git+https://github.com/herumi/xbyak.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'756393516cbbb0402ad688ec2d25b99a710ec9ee9e797cfecb7726d0873f71d8e6e1d77b211d48a565c19631f63f3c9592033448793057a0129fd189ff80d24d'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.dynarmic.url ../citra-dynarmic
	git config submodule.fmt.url ../fmt
	git config submodule.lodepng.url ../lodepng
	git config submodule.nihstro.url ../libretro-nihstro
	git config submodule.soundtouch.url ../citra-soundtouch
	git config submodule.teakra.url ../teakra
	git config submodule.xbyak.url ../xbyak
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../use-system-libs.patch
	sed -i 's/-O[0123s]//;s/-Ofast//' Makefile
	sed -i '/include <array>/i #include <algorithm>' src/common/logging/log.h
	sed -i '/include <vector>/a #include <string>' src/core/frontend/mic.h
}

build() {
	export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig"
	make -C $_pkgname BUILD_DATE= HAVE_FFMPEG_STATIC=0
}

package() {
	depends+=(
		'libavcodec.so'
		'libavutil.so'
		'libboost_serialization.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/citra_libretro.so
}
