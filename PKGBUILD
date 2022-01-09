# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Archimede Pitagorico <archimede.pitagorico@mail.com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=megasync-git
pkgver=4.6.2.0.6.g29453fdca
pkgrel=1
pkgdesc="MEGASync Desktop App. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
conflicts=('megasync'
           'megatools'
           )
provides=('megasync')
depends=('qt5-svg'
         'qt5-x11extras'
         'c-ares'
         'libuv'
         'crypto++'
         'libsodium'
#          'ffmpeg'
         'freeimage'
         'libmediainfo'
         'libraw'
         )
makedepends=('git'
             'qt5-tools'
             )
source=('git+https://github.com/meganz/MEGAsync.git'
        'git+https://github.com/meganz/sdk.git'
        'mega.svg'
        )
sha256sums=('SKIP'
            'SKIP'
            'c0abfeafb541509923c85d253f6f64dae8a49e9ae4b067f5c0c484ff1d924403'
            )

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' | sed 's|\.Ubuntu\.18\.10build||g' | sed 's|CentOS7\.||g' | tr -d v)"
}

prepare() {
  cd MEGAsync
  git config submodule.src/MEGASync/mega.url "${srcdir}/sdk"
  git submodule update --init

  # disabled until sdk#2576 is fixed (-ffmpeg dep)
  sed -e '85s|^|&#|g' -e '100s|^|&#|g' -e '104s|^|&#|g' -e '205s|^|&#|g' -i src/MEGASync/MEGASync.pro
}

build() {
  cd "${srcdir}/MEGAsync/src/MEGASync/mega"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --without-freeimage \
    --disable-examples \
    --without-ffmpeg # disabled until sdk#2576 is fixed (-ffmpeg dep)

  cd "${srcdir}/MEGAsync/src/MEGASync"
  lrelease-qt5 MEGASync.pro
  qmake-qt5 CONFIG+=debug MEGASync.pro

  make
}

package() {
  install -Dm755 MEGAsync/src/MEGASync/megasync "${pkgdir}/usr/bin/megasync"
  install -Dm644 MEGAsync/src/MEGASync/platform/linux/data/megasync.desktop "${pkgdir}/usr/share/applications/megasync.desktop"
  # not works in wayland, so launch in xwayland
  sed -e 's|System;||g' \
      -e 's|Exec=megasync|Exec=env QT_QPA_PLATFORM=xcb megasync|g' \
      -i "${pkgdir}/usr/share/applications/megasync.desktop"
  install -Dm644 "${srcdir}/mega.svg" "${pkgdir}/usr/share/pixmaps/mega.svg"

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
