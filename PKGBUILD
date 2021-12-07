# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=telegram-tdlib-purple-minimal-git
pkgver=0.7.9.r496.80a9163
pkgrel=1
pkgdesc='libpurple Telegram plugin implemented using official tdlib client library, packaged for bitlbee, without voip and image-processing dependencies.'
arch=(any)
url='https://github.com/ars3niy/tdlib-purple'
license=(GPL2)
depends=(libpurple telegram-tdlib)
makedepends=(cmake git)
conflicts=(telegram-tdlib-purple-git)
source=($pkgname::git+"$url")
sha256sums=(SKIP)

pkgver() {
	cd $pkgname
	ver=$(awk '/^\s*set\(VERSION / {sub(")","",$2); print $2}' CMakeLists.txt)
	printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	mkdir -p build
	cd build
	cmake -DNoWebp=True -DNoLottie=True -DNoVoip=True ..
	make
}

package() {
	cd $pkgname
	install -Dm755 -t "$pkgdir$(pkg-config --variable plugindir purple)" build/libtelegram-tdlib.so
}
