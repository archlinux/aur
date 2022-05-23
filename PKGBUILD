pkgname=mujoco
pkgver=2.2.0
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64')
url="https://www.mujoco.org"
license=('Apache')
depends=('libgl' 'glfw' 'tinyxml2' 'tinyobjloader')
makedepends=('libccd' 'abseil-cpp' 'gtest' 'benchmark' 'cmake' 'git')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
    "${pkgname}.patch")
sha256sums=('5bd3847aca1f53e2467b680f797fe74ce6a1c20870e0fee534cfda38a25ea1d5'
            'fa5799290dd68bd2bdd520515484112c3a72079af6425ee6d01b6865e81bdab1')

prepare() {
	cd "${pkgname}-${pkgver}"

	# Use as many system libs as possible
	patch -Np1 -i "${srcdir}/${pkgname}.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release

	make
}

package() {
	cd "${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
    mv $pkgdir/usr/local/* $pkgdir/usr/
    rmdir $pkgdir/usr/local
    mkdir $pkgdir/usr/lib/mujoco
    mv $pkgdir/usr/bin/* $pkgdir/usr/lib/mujoco/
    rmdir $pkgdir/usr/bin
}
