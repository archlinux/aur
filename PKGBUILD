pkgname="libfranka"
pkgver="0.10.0"
pkgrel=2
pkgdesc="C++ library for Franka Emika research robots "
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.ros.org/libfranka"
license=('Apache')
makedepends=('cmake' 'git')
depends=('eigen' 'poco')
provides=($pkgname)
conflicts=($pkgname)

source=(
    "git+https://github.com/frankaemika/libfranka-common.git"
    "git+https://github.com/frankaemika/libfranka.git#tag=$pkgver"
)

sha256sums=(
    SKIP
    SKIP
)

prepare() {

    # add submodule
    cd ${srcdir}/libfranka
    git submodule init
    git config submodule.common.url $srcdir/libfranka-common
    git -c protocol.file.allow=always submodule update

}

build() {
	# Create build directory
  	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  	cd ${srcdir}/build

	# Build project
	cmake ${srcdir}/libfranka \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF
	cmake --build .
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}

