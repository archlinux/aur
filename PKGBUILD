# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=megasync-git
pkgver=2.7.1.1977.fd9cafb
pkgrel=1
pkgdesc="Sync your files to your Mega account. Official app. (GIT Version)"
arch=('i686' 'x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
source=('megasync::git+https://github.com/meganz/MEGAsync.git'
        'megasync.desktop'
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
         )
makedepends=('git'
             'qt5-tools'
             )
sha1sums=('SKIP'
          '077e146596f6e31254675a1e0771ddcc05084f03'
          'f0ce3c0c3297cbb07f211a6ff2a0237823e0c9cd'
          )
install=megasync-git.install

pkgver() {
  cd megasync
  echo "$(< build/version).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
  cd megasync
  install -Dm644 LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd src/MEGASync
  install -Dm755 megasync "${pkgdir}/usr/bin/megasync"
  install -Dm644 "${srcdir}/megasync.desktop" "${pkgdir}/usr/share/applications/megasync.desktop"
  install -Dm644 "${srcdir}/mega.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mega.svg"
}
