# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=megasync-git
pkgver=v2.9.0.0.0.ge46bc5e
pkgrel=1
pkgdesc="Sync your files to your Mega account. Official app. (GIT Version)"
arch=('i686' 'x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
source=('megasync::git+https://github.com/meganz/MEGAsync.git'
        'mega.svg'
        )
conflicts=('megasync' 'megatools')
provides=('megasync')
depends=('qt5-base'
         'c-ares'
         'libuv'
         'curl'
         'crypto++'
         'hicolor-icon-theme'
         'xdg-utils'
         'desktop-file-utils'
         )
makedepends=('git'
             'qt5-tools'
             )
sha1sums=('SKIP'
          'f0ce3c0c3297cbb07f211a6ff2a0237823e0c9cd'
          )
install=megasync-git.install

pkgver() {
  cd megasync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' )"
}

prepare() {
  cd megasync
  sed 's|git@github.com:meganz/sdk.git|https://github.com/meganz/sdk.git|g' -i .gitmodules
  git submodule update --init --recursive

  cd src/MEGASync/mega
  ./autogen.sh
  ./configure \
    --disable-examples \
    --disable-posix-threads \
    --without-freeimage \
    --without-sodium
}

build() {
  cd megasync/src
  qmake-qt5 CONFIG+=release MEGA.pro
  lrelease-qt5 MEGASync/MEGASync.pro
  make
}

package() {
  install -Dm644 megasync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 megasync/src/MEGASync/megasync "${pkgdir}/usr/bin/megasync"
  install -Dm644 megasync/src/MEGASync/platform/linux/data/megasync.desktop "${pkgdir}/usr/share/applications/megasync.desktop"
  sed 's|System;||g' -i "${pkgdir}/usr/share/applications/megasync.desktop"
  install -Dm644 "${srcdir}/mega.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mega.svg"
}
