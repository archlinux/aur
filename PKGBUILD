# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Archimede Pitagorico <archimede.pitagorico@mail.com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=megasync-git
pkgver=5.7.0.0.502.g499ca1353
pkgrel=2
pkgdesc="MEGASync Desktop App. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
depends=(
  'gcc-libs' # libgcc_s.so libgomp.so libstdc++.so
  'glibc' # ld-linux-x86-64.so libc.so libm.so
  'qt5-base' # libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Network.so libQt5Widgets.so
  'qt5-svg' # libQt5Svg.so
  'qt5-x11extras' # libQt5X11Extras.so
  'qt5-declarative' # libQt5Quick.so libQt5Qml.so
  'libuv' # libuv.so
  'crypto++' # libcryptopp.so
  'libsodium' 'libsodium.so'
#   'libpdfium'
  'freeimage' # libfreeimage.so
  'libmediainfo' # libmediainfo.so
  'libxcb' # libxcb.so
  'libzen' # libzen.so
  'c-ares' 'libcares.so'
  'openssl' 'libcrypto.so' 'libssl.so'
  'curl' 'libcurl.so'
  'sqlite' 'libsqlite3.so'
  'ffmpeg' 'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswscale.so'
  'icu' 'libicuuc.so'
  'zlib' 'libz.so'
)
makedepends=(
  'git'
  'qt5-tools'
)
provides=("megasync=${pkgver}")
conflicts=('megasync')
source=(
  'git+https://github.com/meganz/MEGAsync.git'
  'git+https://github.com/meganz/sdk.git'
  'mega.svg'
  'fix_wayland.patch' # based on ::https://github.com/meganz/MEGAsync/pull/992.patch'
  'ffmpeg6.diff'
  '020-megasync-sdk-fix-cmake-dependencies-detection.patch::https://aur.archlinux.org/cgit/aur.git/plain/020-megasync-sdk-fix-cmake-dependencies-detection.patch?h=megasync'
  '030-megasync-app-fix-cmake-dependencies-detection.patch::https://aur.archlinux.org/cgit/aur.git/plain/030-megasync-app-fix-cmake-dependencies-detection.patch?h=megasync'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'c0abfeafb541509923c85d253f6f64dae8a49e9ae4b067f5c0c484ff1d924403'
  '3414065bc732a63e66bb2b21373dc371c23d25f8ce86069073f8ca8c4bd9c74c'
  'a5f1d784a0a548965c939a74da101ff436796490a7d3f4efbaa8c22d639ab8fc'
  'a2d4c9040282f51e81a9d37d9875d4a9febb1ff1f6af452210be581f0eaa63a7'
  'a5883be2d00dbacaacf78231bfeeac27f4e8a471c3256370e94fec3e55b1d171'
)
options=('debug')

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' | sed 's|\.Ubuntu\.18\.10build||g' | sed 's|CentOS7\.||g' | tr -d v)"
}

prepare() {
  cd MEGAsync
  git config submodule.src/MEGASync/mega.url "${srcdir}/sdk"
  git -c protocol.file.allow=always submodule update --init \
    src/MEGASync/mega

  # wayland(?)
  patch -p1 -i "${srcdir}/fix_wayland.patch"

  # FFmpeg6
  patch -d src/MEGASync/mega -p1 -i "${srcdir}/ffmpeg6.diff"

  # fix cmake calls
  patch -d src/MEGASync/mega -p1 -i "${srcdir}/020-megasync-sdk-fix-cmake-dependencies-detection.patch"
  patch -p1 -i "${srcdir}/030-megasync-app-fix-cmake-dependencies-detection.patch"

}

build() {

#   export CXXFLAGS+=' -DNDEBUG -isystem/usr/include/pdfium'
  cmake -B build -S "${srcdir}/MEGAsync" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCMAKE_MODULE_PATH="${srcdir}/MEGAsync/src/MEGASync/mega/cmake/modules/packages" \
    -DCMAKE_SKIP_RPATH=ON \
    -DENABLE_SDKLIB_EXAMPLES=OFF \
    -DENABLE_SDKLIB_TESTS=OFF \
    -DENABLE_DESKTOP_UPDATE_GEN=OFF \
    -DENABLE_DESIGN_TOKENS_IMPORTER=OFF \
    -DUSE_PDFIUM=OFF

  cmake --build build
}

package() {

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${srcdir}/mega.svg" "${pkgdir}/usr/share/pixmaps/mega.svg"

  rm -fr "${pkgdir}/usr/opt"

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
