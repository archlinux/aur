# Maintainer: Daniel Kirchner <daniel@ekpyron.org>
pkgbase=ispc_texcomp
pkgname=ispc_texcomp-git
pkgver=r17.d38d5ac
pkgrel=1
pkgdesc="Fast ISPC Texture Compressor"
arch=(x86_64)
url="https://software.intel.com/en-us/articles/fast-ispc-texture-compressor-update"
license=('MIT')
depends=()
makedepends=('ispc' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('ispc_texcomp::git+https://github.com/GameTechDev/ISPCTextureCompressor.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cd "ISPC Texture Compressor"
    make -f Makefile.linux clean
	unset CXXFLAGS
	unset LDFLAGS
    make -f Makefile.linux ISPC=/usr/bin/ispc
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd "ISPC Texture Compressor"
	mkdir -p "$pkgdir/usr/lib/"
    install -m755 build/libispc_texcomp.so "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include/"
	install -m644 ispc_texcomp/ispc_texcomp.h "$pkgdir/usr/include"
}
