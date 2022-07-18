pkgname=mujoco
pkgver=2.2.1
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64')
url="https://www.mujoco.org"
license=('Apache')
depends=('libccd' 'libgl' 'glfw' 'tinyxml2' 'tinyobjloader')
makedepends=('abseil-cpp' 'gtest' 'benchmark' 'cmake' 'git')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
    "${pkgname}.patch")
sha256sums=('e7fa0821c993073b19bd8034df63661e309edcdc2d602101c3f9b28201574ded'
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
    for _file in $pkgdir/usr/lib/mujoco/*; do
        ln -s /usr/lib/mujoco/$(basename $_file) $pkgdir/usr/bin/mujoco-$(basename $_file)
    done
}
