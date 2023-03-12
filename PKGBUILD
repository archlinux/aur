# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>
# Contributor: Piotr Krzemiński <pio.krzeminski@gmail.com>

pkgname=qnapi
pkgver=0.2.3
pkgrel=6
pkgdesc='Qt client for downloading movie subtitles from NapiProjekt, OpenSubtitles, Napisy24'
arch=('x86_64')
url='https://qnapi.github.io/'
license=('GPL')
depends=('hicolor-icon-theme' 'libmediainfo' 'p7zip' 'qt5-base')
source=("https://github.com/QNapi/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        'qt-5.11.patch'
        '0001-Add-AppStream-metadata-file.patch')
sha256sums=('8debb6862e96e52e4060131b314d9b887051a646a4a57c87c0287f2655357046'
            'c10d4be453ea1ca313079abd5b7caeecb35d99dd711e4da288bf3d74138d0c01'
            '463325b8af9840ce748f862dd6f3b25fd818d64ade98e5fbcd8950cacf7af530')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../qt-5.11.patch
  patch -Np1 -i ../0001-Add-AppStream-metadata-file.patch
  sed -i '/INSTALLS +=/ s/ doc//' qnapi.pro
}

build() {
  cd $pkgname-$pkgver
  qmake-qt5 QMAKE_DEFAULT_INCDIRS='' qnapi.pro
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/kservices5/ServiceMenus/" doc/qnapi-{download,scan}.desktop
}
