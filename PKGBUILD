_name=fuse3-p7zip
pkgname="$_name-git"
pkgver=1.2.0
pkgrel=1
pkgdesc="fuse3 file system that uses the p7zip library to mount archives"
arch=('x86_64')
url="https://github.com/andrew-grechkin/fuse3-p7zip"
license=('GPL')
depends=('fuse3' 'p7zip')
makedepends=('cmake' 'go-md2man')
source=("git+https://github.com/andrew-grechkin/fuse3-p7zip#commit=1c7b2b4bac09f1c55add310874a624194fda2d58")
sha256sums=('SKIP')

prepare() {
	cd "$_name" || exit
	git submodule update --init
}

pkgver() {
	cd "$_name" || exit
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "$_name" || exit
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-S . -B "build-release"
	make -j -C "build-release"
	go-md2man -in=README.md -out="${_name}.1"
}

package() {
	cd "$_name" || exit
	make DESTDIR="$pkgdir" install -C "build-release"
	install -Dm644 "${_name}.1" "$pkgdir/usr/share/man/man1/${_name}.1"
}
