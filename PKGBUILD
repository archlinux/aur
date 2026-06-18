# Maintainer: EliasofWaffle <eliascontato@protonmail.com>

pkgname=libspatialaudio-git
pkgver=0.4.0.r328.17e904b
pkgrel=2
pkgdesc="Spatial audio encoding / decoding and binauralization library"
license=('LGPLv2' 'Proprietary')
arch=('x86_64')
conflicts=(
	'libspatialaudio'
)
provides=('libspatialaudio')
makedepends=(
	'git'
	'meson'
	'gcc'
	'libmysofa'
	)
depends=(
	'libmysofa'
	)
source=('git+https://github.com/videolan/libspatialaudio')
sha256sums=('SKIP')

pkgver() {
  cd libspatialaudio
  #echo "$(git describe --long --tags | tr - .)"
  _ver="$(cat meson.build | grep -m1 'version :' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
	cd libspatialaudio
        
	mkdir -p build
}

build(){

	arch-meson libspatialaudio build \
	-Dmit_hrtf=enabled 
	
	meson compile -C build

}

check() {
  meson test -C build --print-errorlogs || true
}


package() {
	DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build install

}

