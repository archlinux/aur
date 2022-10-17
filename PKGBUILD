pkgname=mujoco-git
_pkgname=mujoco
pkgver=2.2.2.r81.g3aaf94f
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
            '3654132f7685e6c1d4b0f9cddc266e5d2bfe63f440dad53606d8aac4af046642')

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
