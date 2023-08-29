# Maintainer: Karim Vergnes <me@thesola.io>

_ipu_ver=ipu6
pkgname=intel-ipu6-camera-hal-git
_pkgname=ipu6-camera-hal
pkgver=r87.113ca90
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
        -DCMAKE_INSTALL_PREFIX="/usr"   \
        -DLIBGCSS_FOUND=ON              \
        -DLIBGCSS_LIBRARY_DIRS="/usr/lib/ipu_tgl" \
        -DLIBGCSS_INCLUDE_DIRS="/usr/include/ipu_tgl/ia_camera" \
        -DIA_IMAGING_FOUND=ON           \
        -DIA_IMAGING_LIBRARY_DIRS="/usr/lib/ipu_tgl" \
        -DIA_IMAGING_INCLUDE_DIRS="/usr/include/ipu_tgl/ia_imaging" \
        -DLIBIPU_FOUND=ON               \
        -DLIBIPU_LIBRARY_DIRS="/usr/lib/ipu_tgl" \
        -DLIBIPU_INCLUDE_DIRS="/usr/include/ipu_tgl"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    mkdir -p "$pkgdir/etc/ld.so.conf.d"
    echo "/usr/lib/ipu_tgl" > "$pkgdir/etc/ld.so.conf.d/intel-ipu6-camera-bin-tgl.conf"
}
