pkgname=lib32-intel-media-driver
pkgver=24.2.5
pkgrel=1
pkgdesc="Intel Media Driver for VAAPI — Broadwell+ iGPUs — 32-bit"
arch=(x86_64)
url="https://github.com/intel/media-driver"
license=(MIT BSD-3-Clause)
depends=(lib32-gcc-libs lib32-intel-gmmlib lib32-libva)
makedepends=(cmake intel-gmmlib)
source=("${url}"/archive/$(echo ${pkgname%-*}|sed 's/lib32-//')-${pkgver}.tar.gz)
sha256sums=('dec2210c1f824a721e4ea6f66f5899e300801b3e7fae232d3f8a94db38c2edd1')

build() {
        export CC="gcc -m32 -D_FILE_OFFSET_BITS=64"
        export CXX="g++ -m32 -D_FILE_OFFSET_BITS=64"
        export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

        cmake -B build \
        -S ${pkgname#lib32-intel-}-$(echo ${pkgname%-*}|sed 's/lib32-//')-${pkgver} \
        -G Ninja \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR=lib32 \
        -D INSTALL_DRIVER_SYSCONF=OFF \
        -D CMAKE_FIND_ROOT_PATH=/usr/lib32 \
        -D CMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
        -D CMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
        -D CMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
        -D LIBVA_DRIVERS_PATH=/usr/lib32/dri \
        -D X11_xcb_icccm_LIB=/usr/lib32/libxcb-icccm.so \
        -D X11_xcb_util_LIB=/usr/lib32/libxcb-util.so \
        -D X11_xcb_xfixes_LIB=/usr/lib32/libxcb-xfixes.so \
        -D X11_xkbfile_LIB=/usr/lib32/libxkbfile.so \
        -D X11_xkbcommon_LIB=/usr/lib32/libxkbcommon.so \
        -D X11_xkbcommon_X11_LIB=/usr/lib32/libxkbcommon-x11.so \
        -D X11_XRes_LIB=/usr/lib32/libXRes.so \
        -D X11_Xaw_LIB=/usr/lib32/libXaw.so \
        -D X11_Xpm_LIB=/usr/lib32/libXpm.so \
        -DMEDIA_BUILD_FATAL_WARNINGS=OFF \
        -D ARCH=32 \
        -W no-dev
        cmake --build build
}

package() {
        DESTDIR="${pkgdir}" cmake --install build
        rm -r "$pkgdir/usr/include"
        install -Dm644 ${pkgname#lib32-intel-}-$(echo ${pkgname%-*}|sed 's/lib32-//')-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
