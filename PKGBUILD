# Maintainer: éclairevoyant
# Contributor: Frantic1048 <archer at frantic1048 dot com>

_pkgname=torch7-cunn
pkgname="$_pkgname-git"
pkgver=r819.1ae6aa0
pkgrel=5
pkgdesc='CUDA backend for Torch7 Neural Network Package'
arch=('x86_64' 'i686')
url='https://github.com/torch/cunn'
license=('custom')
depends=('cuda' 'torch7-cutorch-git' 'torch7-git>=r819' 'torch7-nn-git')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname

	# https://stackoverflow.com/questions/46345811/cuda-9-shfl-vs-shfl-sync
	sed 's/__shfl(/__shfl_sync(0xFFFFFFFF, /g;s/__any(/__any_sync(0xFFFFFFFF, /g' \
		-i lib/THCUNN/LookupTable.cu
}

build() {
	CFLAGS="${CFLAGS/-fno-plt/}"
	CXXFLAGS="${CFLAGS/-fno-plt/}"

	cd $_pkgname
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install

	# Move Lua C module
	install -dm755 "$pkgdir/usr/lib/lua/5.1/"
	mv "$pkgdir/usr/lib/libTHCUNN.so" "$pkgdir/usr/lib/lua/5.1/"

	# Move pure Lua modules
	install -dm755 "$pkgdir/usr/share/lua/5.1/"
	mv "$pkgdir/usr/lua/cunn" "$pkgdir/usr/share/lua/5.1/"
	rm -rf "$pkgdir/usr/lua"

	install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
