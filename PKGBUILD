# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=megasync-git
pkgver=v2.9.10.0.g2e03defa
pkgrel=1
pkgdesc="Sync your files to your Mega account. Official app. (GIT Version)"
arch=('i686' 'x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
source=('git+https://github.com/meganz/MEGAsync.git'
        'git+https://github.com/meganz/sdk.git'
        'mega.svg'
        )
conflicts=('megasync'
           'megatools'
           )
provides=('megasync')
depends=('qt5-base'
         'c-ares'
         'libuv'
         'curl'
         'crypto++'
         'libsodium'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'qt5-tools'
             )
sha256sums=('SKIP'
            'SKIP'
            'c0abfeafb541509923c85d253f6f64dae8a49e9ae4b067f5c0c484ff1d924403'
           )

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' )"
}

prepare() {
  cd MEGAsync
  git config submodule.src/MEGASync/mega.url "${srcdir}/sdk"
  git submodule update --init

  cd src/MEGASync/mega
  ./autogen.sh
  ./configure \
    --without-freeimage
}

build() {
  cd MEGAsync/src/MEGASync
  lrelease-qt5 MEGASync.pro
  qmake-qt5 CONFIG+=release MEGASync.pro
  make
}

package() {
  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 MEGAsync/src/MEGASync/megasync "${pkgdir}/usr/bin/megasync"
  install -Dm644 MEGAsync/src/MEGASync/platform/linux/data/megasync.desktop "${pkgdir}/usr/share/applications/megasync.desktop"
  sed 's|System;||g' -i "${pkgdir}/usr/share/applications/megasync.desktop"
  install -Dm644 "${srcdir}/mega.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mega.svg"
}
