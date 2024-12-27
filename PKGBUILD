# Maintainer: Andrew Grechkin <andrew.grechkin@gmail.com>
_name=fuse3-p7zip
pkgname="$_name-git"
pkgver=2.1.0
pkgrel=1
pkgdesc="fuse3 file system that uses the 7zip library to mount archives"
arch=('x86_64')
url="https://github.com/andrew-grechkin/fuse3-p7zip"
license=('GPL')
depends=('fuse3' '7zip')
makedepends=('cmake' 'git' 'go-md2man')
source=("git+https://github.com/andrew-grechkin/fuse3-p7zip#commit=$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$_name"
	git submodule update --init
}

pkgver() {
	cd "$_name"
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "$_name"
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-S . -B "build-release"
	make -j -C "build-release"
	go-md2man -in=README.md -out="${_name}.1"
}

package() {
	cd "$_name"
	make DESTDIR="$pkgdir" install -C "build-release"
	install -Dm644 "${_name}.1" "$pkgdir/usr/share/man/man1/${_name}.1"
}
