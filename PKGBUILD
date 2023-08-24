pkgname=lib32-intel-media-driver
tarname=intel-media-driver

pkgver=23.2.4
pkgrel=1
pkgdesc="Intel Media Driver for VAAPI — Broadwell+ iGPUs"
arch=(x86_64)
url="https://github.com/intel/media-driver/"
license=(MIT BSD)
depends=(
lib32-gcc-libs
'lib32-intel-gmmlib>=22.3.10'
'lib32-libva>=2.19.0'
lib32-libpciaccess
)
makedepends=(
cmake
ninja
)
source=("${url}"/archive/${tarname%-*}-${pkgver}.tar.gz)
sha256sums=('dfcf2facc4f8bf3df6b147222786032be195874adacc2f4071fc6c91a0abdf0a')

build() {
  export CC="gcc -m32 -D_FILE_OFFSET_BITS=64"
  export CXX="g++ -m32 -D_FILE_OFFSET_BITS=64"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -B build -W no-dev \
    -S ${tarname#*-}-${tarname%-*}-${pkgver} \
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
    -D ARCH=32 
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  rm -r "$pkgdir/usr/include"

  install -Dm644 ${tarname#*-}-${tarname%-*}-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
