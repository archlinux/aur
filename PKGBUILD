# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=libudev-zero-git
_pkgname=libudev-zero
pkgver=219
pkgrel=1
libudev_ver=1-64
so_ver=1.6.3
pkgdesc="Daemonless replacement for libudev "
arch=('x86_64' 'aarch64')
url="https://github.com/illiliti/libudev-zero"
license=('GPL')
makedepends=('glibc' 'make' 'git')
provides=('libudev-zero' 'libeudev' 'libudev' "libudev.so=$libudev_ver")
conflicts=('libudev')
source=("git+https://github.com/illiliti/libudev-zero"
        artix-install.patch)
md5sums=('SKIP'
         'b951df22b38f2c30383334a462a1ec2a')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
	cd ${_pkgname}

	patch -p0 -i ../artix-install.patch
}

build() {
	cd ${_pkgname}

	LIBUDEV_VER="${so_ver}" make

	msg "Compiling helper"
	cd contrib
	gcc $CFLAGS -o libudev-helper helper.c
}

package() {
	cd ${_pkgname}

	LIBUDEV_VER="${so_ver}" make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -Dm755 contrib/libudev-helper "${pkgdir}"/usr/bin/libudev-helper
}

