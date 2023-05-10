pkgname=mujoco
pkgver=2.3.5
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64')
url="https://www.mujoco.org"
license=('Apache')
depends=('libccd' 'libgl' 'glfw' 'tinyxml2' 'tinyobjloader' 'qhull')
makedepends=('abseil-cpp' 'gtest' 'benchmark' 'cmake' 'git' 'eigen')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
    "${pkgname}.patch")
sha256sums=('882d855d833375ad27adfa2d9cf4ec2381a1069ebe8fbc4578d876deb4e0b33f'
            '3ceb20c5b0dc37cf9be4da68f728b11f3085fdcbd895eb2885910228c4d3805f')

prepare() {
	cd "${pkgname}-${pkgver}"

	# Use as many system libs as possible
    # Patch to use system qhull comes from https://github.com/conda-forge/staged-recipes/pull/19049
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
    mkdir $pkgdir/usr/lib/mujoco/plugins
    cp lib/libelasticity.so $pkgdir/usr/lib/mujoco/plugins/
    for _file in $pkgdir/usr/lib/mujoco/*; do
        ln -s /usr/lib/mujoco/$(basename $_file) $pkgdir/usr/bin/mujoco-$(basename $_file)
    done
}
