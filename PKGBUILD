# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgbase=libajantv2
pkgname=('libajantv2' 'ajantv2-tools'  'ajantv2-dkms')
pkgdesc="Open-source SDK for discovering, interrogating and controlling NTV2 professional video I/O devices from AJA Video Systems, Inc"
_pkgver=17.5.0
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=1
arch=("x86_64" "aarch64")
url="https://github.com/aja-video/libajantv2"
license=(MIT)
makedepends=("cmake" "git")
options=('debug')
source=("libajantv2::git+https://github.com/aja-video/libajantv2.git#commit=792732f6893998daa869564f0f60f4c83b9ffbc5")
sha256sums=("SKIP")

prepare() {
  cd libajantv2

  # Properly make CNTV2DeviceScanner::GetDeviceInfoList a class method (https://github.com/aja-video/libajantv2/pull/57)
  sed -i "s|NTV2DeviceInfoList	GetDeviceInfoList|NTV2DeviceInfoList CNTV2DeviceScanner::GetDeviceInfoList|g" ajantv2/src/ntv2devicescanner.cpp

  # Use ccflags-y instead of EXTRA_CFLAGS (https://github.com/aja-video/libajantv2/pull/55)
  sed -i "s|EXTRA_CFLAGS|ccflags-y|g" driver/linux/Makefile

  # Add fixup VERSION and add SOVERSION
  sed -i 's|VERSION "${AJA_NTV2_VER_STR}"|VERSION "${AJA_NTV2_VER_STR}" SOVERSION "${AJA_NTV2_SDK_VERSION_MAJOR}"|g' ajantv2/CMakeLists.txt
}

# TODO: Add Qt deps ("qt6-base" "qt6-multimedia") and create the demo package
build() {
  cmake -B build -S libajantv2 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DAJANTV2_BUILD_OPENSOURCE=ON \
    -DAJANTV2_BUILD_SHARED=ON \
    -DAJANTV2_DISABLE_DEMOS=ON \
    -DAJANTV2_DISABLE_DRIVER=ON \
    -DAJANTV2_DISABLE_TESTS=ON \
    -DAJANTV2_DISABLE_TOOLS=OFF \
    -DAJANTV2_DISABLE_PLUGIN_LOAD=ON \
    -DAJA_INSTALL_HEADERS=ON \
    -DAJA_INSTALL_SOURCES=OFF \
    -DAJA_INSTALL_CMAKE=OFF \
    -DAJA_INSTALL_MISC=OFF \
    -DAJA_DISABLE_QT=ON \
    -DAJA_DISABLE_AMD=ON \
    -DAJA_DISABLE_NVIDIA=ON \
    -Wno-dev

  cmake --build build

  DESTDIR="$srcdir/fakeinstall" cmake --install build
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    mv -v "${src}" "${dir}/"
  done
}

package_libajantv2() {
  depends=("gcc-libs" "glibc" "systemd-libs")

  _install fakeinstall/usr/include
  _install fakeinstall/usr/lib

  install -Dm644 libajantv2/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ajantv2-tools() {
  depends=("gcc-libs" "glibc" "libajantv2")

  _install fakeinstall/usr/bin  

  install -Dm644 libajantv2/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ajantv2-dkms()
{
  pkgdesc="Open-source device driver for discovering, interrogating and controlling NTV2 professional video I/O devices from AJA Video Systems, Inc"
  arch=('any')
  depends=('dkms')
  provides=('ajantv2')
  conflicts=('ajantv2')

  # Clean CMake bad practice
  rm -rf libajantv2/ajantv2/includes/ntv2version.h

  install -Dm644 libajantv2/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd libajantv2/driver/linux
  
  make ntv2version_gen
  make dkms-pkg

  _dkmsdir="$(ls tmp)"

  install -dm 755 "${pkgdir}"/usr/src
  cp -dr --no-preserve='ownership' tmp/${_dkmsdir} "${pkgdir}/usr/src/."

  echo "ajantv2" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
}
