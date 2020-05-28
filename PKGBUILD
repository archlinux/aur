_name=fuse3-p7zip
pkgname="$_name-git"
pkgver=0.9.0
pkgrel=1
pkgdesc="fuse3 file system that uses the p7zip library to mount archives"
arch=('x86_64')
url="https://github.com/andrew-grechkin/fuse3-p7zip"
license=('GPL')
depends=('fuse3' 'p7zip')
makedepends=('cmake')
_commit=a9014b2348d8e1427d11be71cf0c109fc3198bd4
source=("git+https://github.com/andrew-grechkin/fuse3-p7zip#commit=$_commit")
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
	mkdir -p build-release
	pushd build-release
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	popd
	make -C build-release
}

package() {
	cd "$_name"
	make DESTDIR="$pkgdir" install -C build-release
}
