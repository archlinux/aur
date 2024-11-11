# Maintainer: Andrew Grechkin <andrew.grechkin@gmail.com>
_name=fuse3-p7zip
pkgname="$_name-git"
pkgver=1.2.2
pkgrel=1
pkgdesc="fuse3 file system that uses the p7zip library to mount archives"
arch=('x86_64')
url="https://github.com/andrew-grechkin/fuse3-p7zip"
license=('GPL')
depends=('fuse3' 'p7zip')
makedepends=('cmake' 'git' 'go-md2man')
source=("git+https://github.com/andrew-grechkin/fuse3-p7zip#commit=b6b3ee8614cc75900a84cfd8c402598aa33e16b9")
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
