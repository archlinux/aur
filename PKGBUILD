pkgname=mujoco-git
_pkgname=mujoco
pkgver=2.2.1.r13.g95b6327
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64')
url="https://www.mujoco.org"
license=('Apache')
depends=('libccd' 'libgl' 'glfw' 'tinyxml2' 'tinyobjloader' 'qhull')
makedepends=('abseil-cpp' 'gtest' 'benchmark' 'cmake' 'git')
provides=('mujoco')
conflicts=('mujoco')
source=("git+https://github.com/deepmind/mujoco.git"
    "$_pkgname.patch")
sha256sums=('SKIP'
            'fa3ec3a529a80aa74804c23fe8b7a0d3ddebd0c86cef1597e60aaf5cb39c7317')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	# Use as many system libs as possible
    # Patch to use system qhull comes from https://github.com/conda-forge/staged-recipes/pull/19049
	patch -Np1 -i "${srcdir}/$_pkgname.patch"
}

build() {
	cd "$_pkgname"
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release

	make
}

package() {
	cd "$_pkgname/build"
    make DESTDIR="${pkgdir}" install
    mv $pkgdir/usr/local/* $pkgdir/usr/
    rmdir $pkgdir/usr/local
    mkdir $pkgdir/usr/lib/mujoco
    mv $pkgdir/usr/bin/* $pkgdir/usr/lib/mujoco/
    for _file in $pkgdir/usr/lib/mujoco/*; do
        ln -s /usr/lib/mujoco/$(basename $_file) $pkgdir/usr/bin/mujoco-$(basename $_file)
    done
}
