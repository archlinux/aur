# Maintainer: Karim Vergnes <me@thesola.io>

_ipu_ver=ipu6
pkgname=intel-ipu6-camera-hal-git
_pkgname=ipu6-camera-hal
pkgver=r40.5bc81d1
pkgrel=1
pkgdesc="Intel IPU6 camera HAL (Tiger Lake)"
arch=('x86_64')
url="https://github.com/intel/ipu6-camera-hal"
license=('unknown')
depends=('intel-ipu6-dkms-git' 'intel-ipu6-camera-bin')
makedepends=('git' 'cmake')
provides=(ipu6-camera-hal)
conflicts=(intel-ipu6ep-camera-hal-git)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$_pkgname"       \
        -DCMAKE_BUILD_TYPE=Release      \
        -DIPU_VER=$_ipu_ver             \
        -DENABLE_VIRTUAL_IPU_PIPE=OFF   \
        -DUSE_PG_LITE_PIPE=ON           \
        -DUSE_STATIC_GRAPH=OFF          \
        -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    for file in $srcdir/$_pkgname/config/linux/rules.d/*.rules
    do
        install -Dm644 $file $pkgdir/usr/lib/udev/rules.d/
    done
}
