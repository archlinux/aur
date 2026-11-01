# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=ffmpeg-dektec
pkgver=9.0.2_dektec12
pkgrel=1
epoch=1
_cdtapiver=6.14.14
_dtnmosver=0.5.4
_civetwebver=1.16
_tag="n${pkgver%%_*}-${pkgver#*_}"
pkgdesc='FFmpeg with DekTec SDI, DVB-ASI and SMPTE ST 2110 devices, including NMOS, on CDTAPI'
arch=('x86_64')
url='https://github.com/dektec-com/ffmpeg-dektec'
license=('LGPL-2.1-or-later' 'BSD-3-Clause' 'MIT')
depends=(
  'curl'
  'dektec-drivers-dkms'
  'glibc'
  'sdl2'
  'zlib'
)
makedepends=(
  'cmake'
  'nasm'
  'pkgconf'
)
conflicts=('ffmpeg-dektec-bin')
options=('!lto')
source=(
  "${pkgname}-${_tag}-source.tar.xz::https://github.com/dektec-com/ffmpeg-dektec/releases/download/${_tag}/${pkgname}-${_tag}-source.tar.xz"
  "cdtapi-${_cdtapiver}.tar.gz::https://github.com/dektec-com/cdtapi/archive/refs/tags/v${_cdtapiver}.tar.gz"
  "dtnmos-${_dtnmosver}.tar.gz::https://github.com/dektec-com/dtnmos/archive/refs/tags/v${_dtnmosver}.tar.gz"
  "civetweb-${_civetwebver}.tar.gz::https://github.com/civetweb/civetweb/archive/refs/tags/v${_civetwebver}.tar.gz"
)
sha256sums=('3062b32a3ad9d2699e3db8468ce6a23df10ec5e7d533c4ed15ae2eebd25529f7'
            '4cd476f454663dad04b54b0d2ae70b937ffb76aec5d714c0532c06e1307bf781'
            '3d0010d1e8abea4dcae6400baab7853b83d6fbf9840e1ec5664d886912fa3caa'
            'f0e471c1bf4e7804a6cfb41ea9d13e7d623b2bcc7bc1e2a4dd54951a24d60285')

# CDTAPI, dtnmos and civetweb are not in the repositories; they are built here into a
# local prefix and linked statically, with the same options DekTec's own release uses.
# CDTAPI (BSD-3-Clause) talks to the DtPcie driver itself, so --enable-nonfree is no
# longer needed: the result is LGPL-2.1-or-later and redistributable.
build() {
  local _prefix="${srcdir}/libs"

  # civetweb: the HTTP server of the NMOS node, as DekTec's vcpkg port builds it
  # (zlib and websockets on, SSL off). CMake 4 needs the policy floor: 1.16 predates it.
  cmake -S "civetweb-${_civetwebver}" -B build-civetweb \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$_prefix" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCIVETWEB_ALLOW_WARNINGS=ON \
    -DCIVETWEB_BUILD_TESTING=OFF \
    -DCIVETWEB_ENABLE_ASAN=OFF \
    -DCIVETWEB_ENABLE_CXX=OFF \
    -DCIVETWEB_ENABLE_DEBUG_TOOLS=OFF \
    -DCIVETWEB_ENABLE_IPV6=ON \
    -DCIVETWEB_ENABLE_SERVER_EXECUTABLE=OFF \
    -DCIVETWEB_ENABLE_SSL=OFF \
    -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF \
    -DCIVETWEB_ENABLE_WEBSOCKETS=ON \
    -DCIVETWEB_ENABLE_ZLIB=ON
  cmake --build build-civetweb --parallel "$(nproc)"
  cmake --install build-civetweb

  # dtnmos: SDP and NMOS (IS-04/IS-05), on libcurl and civetweb
  cmake -S "dtnmos-${_dtnmosver}" -B build-dtnmos \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$_prefix" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_PREFIX_PATH="$_prefix" \
    -DBUILD_SHARED_LIBS=OFF \
    -DDTNMOS_BUILD_EXAMPLES=OFF \
    -DDTNMOS_BUILD_TESTS=OFF \
    -DDTNMOS_WARNINGS_AS_ERRORS=OFF \
    -DDTNMOS_WITH_CURL=ON \
    -DDTNMOS_WITH_SERVER=ON
  cmake --build build-dtnmos --parallel "$(nproc)"
  cmake --install build-dtnmos

  # CDTAPI, with its NMOS bridge
  cmake -S "cdtapi-${_cdtapiver}" -B build-cdtapi \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$_prefix" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_PREFIX_PATH="$_prefix" \
    -DCDTAPI_BUILD_EXAMPLES=OFF \
    -DCDTAPI_BUILD_SHARED=OFF \
    -DCDTAPI_BUILD_TESTS=OFF \
    -DCDTAPI_WARNINGS_AS_ERRORS=OFF \
    -DCDTAPI_WITH_NMOS=ON
  cmake --build build-cdtapi --parallel "$(nproc)"
  cmake --install build-cdtapi

  # civetweb installs its pkg-config file into share/pkgconfig, the others into lib
  export PKG_CONFIG_PATH="${_prefix}/lib/pkgconfig:${_prefix}/share/pkgconfig"
  cd "${pkgname}-${_tag}"
  ./configure \
    --prefix='/usr' \
    --disable-autodetect \
    --disable-doc \
    --disable-shared \
    --disable-stripping \
    --enable-sdl2 \
    --enable-libcdtapi \
    --enable-libcdtapi-nmos \
    --enable-ffplay \
    --enable-ffprobe \
    --pkg-config-flags=--static
  # Report the upstream tag in `ffmpeg -version`, as DekTec's release builds do;
  # left alone, version.sh would describe the enclosing AUR git clone instead.
  make -j"$(nproc)" REVISION="${_tag}"
}

package() {
  cd "${pkgname}-${_tag}"

  install -vDm 755 'ffmpeg' "${pkgdir}/usr/bin/ffmpeg-dektec"
  install -vDm 755 'ffplay' "${pkgdir}/usr/bin/ffplay-dektec"
  install -vDm 755 'ffprobe' "${pkgdir}/usr/bin/ffprobe-dektec"

  install -vDm 644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -vDm 644 'COPYING.LGPLv2.1' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LGPLv2.1"
  install -vDm 644 "${srcdir}/cdtapi-${_cdtapiver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CDTAPI"
  install -vDm 644 "${srcdir}/dtnmos-${_dtnmosver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.DTNMOS"
  install -vDm 644 "${srcdir}/dtnmos-${_dtnmosver}/THIRD-PARTY-NOTICES" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.DTNMOS"
  install -vDm 644 "${srcdir}/civetweb-${_civetwebver}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CIVETWEB"
}

# vim: set ts=2 sw=2 et:
