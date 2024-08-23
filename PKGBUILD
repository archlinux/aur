# Maintainer: Matthias Gatto <uso.cosmo.ray at gmail dot com>

pkgname=yirl-git
pkgver=r2693.0e055645
pkgrel=1
pkgdesc='Modular Game Engine'


arch=('x86_64' 'aarch64')

url='http://github.com/cosmo-ray/yirl'

licence=(LGPL3)

pkgver() {
	 cd "${srcdir}/yirl"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=(gcc make autoconf cmake git)
depends=(lua json-c sdl2 sdl2_image sdl2_ttf sdl2_mixer perl)

source=(git+https://github.com/cosmo-ray/yirl.git)

options=(!buildflags)

sha256sums=("SKIP")

build() {
	 cd "${srcdir}/yirl"
	 git submodule update --init --recursive
	 ./configure --ndebug --prefix="$pkgdir/usr/"
	 make sdl-gpu-build
	 cd tinycc
	 ./configure --extra-cflags="-fPIC -O2"
	 make
	 cd ..
	 make quickjs-2020-03-16
	 make yirl-loader
}

package() {
	 cd "${srcdir}/yirl"
	 make install
	 make install_extra_modules
	 install -D "${srcdir}/yirl/LICENSE" "$pkgdir/usr/share/licenses/yirl/LICENSE"
}
