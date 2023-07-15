# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Archimede Pitagorico <archimede.pitagorico@mail.com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=megasync-git
pkgver=4.9.5.0.5.g4127676aa
pkgrel=1
pkgdesc="MEGASync Desktop App. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
provides=("megasync=${pkgver}")
conflicts=(
  'megatools'
  'megatools-bin'
  'megasync'
  'megasync-bin'
)
depends=(
  'gcc-libs'
  'glibc'
  'qt5-base'
  'qt5-svg'
  'qt5-x11extras'
  'libuv'
  'crypto++'
  'libsodium'
  'ffmpeg4.4'
  'freeimage'
  'libmediainfo'
  'libraw'
  'libxcb'
  'libzen'
  'zlib'
)
makedepends=(
  'git'
  'qt5-tools'
  'bzip2'
  'c-ares'
  'openssl'
  'libglvnd'
  'curl'
  'xz'
  'sqlite'
  'systemd-libs'
  'ffmpeg'
)
source=(
  'git+https://github.com/meganz/MEGAsync.git'
  'git+https://github.com/meganz/sdk.git'
  'mega.svg'
  'esee'
  'ffmpeg6.diff'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'c0abfeafb541509923c85d253f6f64dae8a49e9ae4b067f5c0c484ff1d924403'
  '66b5f481081157eee82653b3774d22edb5aa2007cf93142fd73cc0c4d577d59f'
  'a5f1d784a0a548965c939a74da101ff436796490a7d3f4efbaa8c22d639ab8fc'
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

  # FFmpeg6
  patch -d src/MEGASync/mega -p1 -i "${srcdir}/ffmpeg6.diff"

  # Disable PDFium
  patch -p1 -i "${srcdir}/esee"
}

build() {

  cd "${srcdir}/MEGAsync/src/MEGASync/mega"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --without-freeimage \
    --disable-examples

  cd "${srcdir}/MEGAsync/src/MEGASync"
  lrelease-qt5 MEGASync.pro
  qmake-qt5 CONFIG+=debug MEGASync.pro

  make
}

package() {
  depends+=(
    'bzip2' 'libbz2.so'
    'c-ares' 'libcares.so'
    'openssl' 'libcrypto.so' 'libssl.so'
    'libglvnd' 'libGL.so'
    'curl' 'libcurl.so'
    'xz' 'liblzma.so'
    'sqlite' 'libsqlite3.so'
    'systemd-libs' 'libudev.so'
    'ffmpeg' 'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswresample.so' 'libswscale.so'
  )
  install -Dm755 MEGAsync/src/MEGASync/megasync "${pkgdir}/usr/bin/megasync"
  install -Dm644 MEGAsync/src/MEGASync/platform/linux/data/megasync.desktop "${pkgdir}/usr/share/applications/megasync.desktop"
  # not works in wayland, so launch in xwayland
  sed -e 's|System;||g' \
      -e 's|Exec=megasync|Exec=env QT_QPA_PLATFORM=xcb megasync|g' \
      -i "${pkgdir}/usr/share/applications/megasync.desktop"
  install -Dm644 "${srcdir}/mega.svg" "${pkgdir}/usr/share/pixmaps/mega.svg"

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
