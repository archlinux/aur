# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-citra
pkgname=$_pkgname-git
pkgver=r9304.d7e1612c1
pkgrel=1
pkgdesc="Nintendo 3DS core"
arch=('x86_64')
url="https://github.com/libretro/citra"
license=('GPL2')
groups=('libretro')
depends=('crypto++' 'enet' 'gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('boost' 'ffmpeg' 'git' 'zstd')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'citra-dynarmic::git+https://github.com/citra-emu/dynarmic.git'
	'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch.git'
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
	'a998c5a124daa79d2483aa97d0307140243a4184fa7eac523f4119152dda54910c11738fc82330ac192978b80b997b7c1e757213c411ee42c939d09dbb24e5d8'
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
