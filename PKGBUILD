pkgname=lib32-intel-media-driver
tarname=intel-media-driver

pkgver=22.5.4
pkgrel=1
pkgdesc="Intel Media Driver for VAAPI — Broadwell+ iGPUs"
arch=(x86_64)
url="https://github.com/intel/media-driver/"
license=(MIT BSD)
depends=(
lib32-gcc-libs
'lib32-intel-gmmlib>=22.2.0'
'lib32-libva>=2.16.0'
lib32-libpciaccess
)
makedepends=(cmake)
source=("${url}"/archive/${tarname%-*}-${pkgver}.tar.gz)
sha256sums=('08d8d041f94b094a2dd5c4739c413b75185521c7f788a02411395ff374ee4ead')

build() {
  export CC="gcc -m32 -D_FILE_OFFSET_BITS=64"
  export CXX="g++ -m32 -D_FILE_OFFSET_BITS=64"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -B build -S ${tarname#*-}-${tarname%-*}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DINSTALL_DRIVER_SYSCONF=OFF \
    -DCMAKE_FIND_ROOT_PATH=/usr/lib32 \
    -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
    -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
    -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
    -DLIBVA_DRIVERS_PATH=/usr/lib32/dri \
    -DX11_xcb_icccm_LIB=/usr/lib32/libxcb-icccm.so \
    -DX11_xcb_util_LIB=/usr/lib32/libxcb-util.so \
    -DX11_xcb_xfixes_LIB=/usr/lib32/libxcb-xfixes.so \
    -DX11_xkbfile_LIB=/usr/lib32/libxkbfile.so \
    -DX11_xkbcommon_LIB=/usr/lib32/libxkbcommon.so \
    -DX11_xkbcommon_X11_LIB=/usr/lib32/libxkbcommon-x11.so \
    -DX11_XRes_LIB=/usr/lib32/libXRes.so \
    -DX11_Xaw_LIB=/usr/lib32/libXaw.so \
    -DX11_Xpm_LIB=/usr/lib32/libXpm.so \
    -DARCH=32 \
    -Wno-dev

  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/include"

  install -Dm644 ${tarname#*-}-${tarname%-*}-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
