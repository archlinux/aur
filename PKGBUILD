# Maintainer: Ayla Ounce <ayla@ounce.email>
# Contributor: Karim Vergnes <me@thesola.io>

pkgname=intel-ipu6-camera-hal-git
_pkgname=ipu6-camera-hal
pkgver=r126.c933525
pkgrel=2
pkgdesc="Intel IPU6 camera HAL (Tiger Lake / Alder Lake / Meteor Lake)"
arch=('x86_64')
url="https://github.com/intel/ipu6-camera-hal"
license=('Apache-2.0')
depends=('intel-ipu6-camera-bin' 'libdrm')
makedepends=('git' 'cmake')
provides=(ipu6-camera-hal)
conflicts=(intel-ipu6ep-camera-hal-git)
replaces=(intel-ipu6ep-camera-hal-git)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B "$_pkgname/build" -S "$_pkgname"       \
        -DCMAKE_BUILD_TYPE=Release      \
        -DCMAKE_INSTALL_PREFIX="/usr"   \
        -DCMAKE_INSTALL_LIBDIR="lib"    \
        -DBUILD_CAMHAL_ADAPTOR=ON       \
        -DBUILD_CAMHAL_PLUGIN=ON        \
	-DIPU_VERSIONS="ipu6;ipu6ep;ipu6epmtl" \
        -DUSE_PG_LITE_PIPE=ON \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build "$_pkgname/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$_pkgname/build"
}
