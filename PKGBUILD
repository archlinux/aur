# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>

pkgname=simg-tools
pkgver=10.0.0_r14
pkgrel=1
pkgdesc="Tools to handle/convert Android sparse image file (simg2img, append2simg, img2simg, simg2simg)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://android.googlesource.com/platform/system/core"
license=('Apache')
depends=('zlib')
makedepends=('git')
source=(git+https://android.googlesource.com/platform/system/core#tag=android-${pkgver})
md5sums=('SKIP')

prepare() {
	cd "${srcdir}/core/libsparse"
	sed -i '25 i\#include <string.h>' sparse_read.cpp
}

build() {
	cd "${srcdir}/core/libsparse"
	g++ -c -o sparse_read.o sparse_read.cpp -Iinclude -I../base/include -lz
	g++ -c -o stringprintf.o ../base/stringprintf.cpp -Iinclude -I../base/include
	g++ -c -o sparse_crc32.o sparse_crc32.cpp -Iinclude -I../base/include
	g++ -c -o backed_block.o backed_block.cpp -Iinclude -I../base/include
	g++ -c -o output_file.o output_file.cpp -Iinclude -I../base/include
	g++ -c -o sparse.o sparse.cpp -Iinclude -I../base/include
	g++ -c -o sparse_err.o sparse_err.cpp -Iinclude -I../base/include
	g++ -c -o simg2img.o simg2img.cpp -Iinclude -I../base/include
	g++ -c -o append2simg.o append2simg.cpp -Iinclude -I../base/include
	g++ -c -o img2simg.o img2simg.cpp -Iinclude -I../base/include
	g++ -c -o simg2simg.o simg2simg.cpp -Iinclude -I../base/include -fpermissive
	g++ -o simg2img simg2img.o sparse_crc32.o backed_block.o output_file.o sparse.o sparse_err.o sparse_read.o stringprintf.o -lz
	g++ -o append2simg append2simg.o sparse_crc32.o backed_block.o output_file.o sparse.o sparse_err.o sparse_read.o stringprintf.o -lz
	g++ -o img2simg -Iinclude img2simg.o sparse_crc32.o backed_block.o output_file.o sparse.o sparse_err.o sparse_read.o stringprintf.o -lz
	g++ -o simg2simg -Iinclude simg2simg.o sparse_crc32.o backed_block.o output_file.o sparse.o sparse_err.o sparse_read.o stringprintf.o -lz
}

package() {
	cd "${srcdir}/core/libsparse"
	install -D -m 755 -t "${pkgdir}/usr/bin/" simg2img append2simg img2simg simg2simg 
}
