# Maintainer: Matthias Gatto <uso.cosmo.ray at gmail dot com>

pkgname=yirl-git
pkgver=r2109.4fa4384e
pkgrel=1
pkgdesc='Modular Game Engine'


arch=('x86_64' 'aarch64')

url='http://github.com/cosmo-ray/yirl'

licence=(LGPL3)

pkgver() {
	 cd "${srcdir}/yirl"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=(gcc make autoconf cmake)
# hopefully I should be able to remove glib2 and add sdl2-mixer soon
depends=(lua json-c sdl2 sdl2_image sdl2_ttf sdl2_mixer glib2)

source=(git+https://github.com/cosmo-ray/yirl.git)

options=(!buildflags)

sha256sums=("SKIP")

build() {
	 cd "${srcdir}/yirl"
	 git submodule update --init --recursive
	 ./configure --clone-sdl-mixer --ndebug --prefix="$pkgdir/usr/"
	 make sdl-gpu-build
	 cd tinycc
	 ./configure --extra-cflags="-fPIC -O2"
	 make
	 cd ..
	 cd SDL_mixer
	 ./autogen.sh
	 ./configure CFLAGS="-fPIC -O2"
	 make
	 cd ..
	 make quickjs-2020-03-16
	 make
}

package() {
	 cd "${srcdir}/yirl"
	 make install
	 make install_extra_modules
	 install -D "${srcdir}/yirl/LICENSE" "$pkgdir/usr/share/licenses/yirl/LICENSE"
}
