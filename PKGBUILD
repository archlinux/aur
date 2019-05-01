# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alcasa Mz <alcasa.mz@gmail.com>

pkgname=sni-qt
pkgver=0.2.6
pkgrel=5
pkgdesc='Qt4 plugin which turns all QSystemTrayIcon into StatusNotifierItems (appindicators)'
arch=('x86_64')
url='https://launchpad.net/sni-qt'
license=('LGPL3')
depends=('libdbusmenu-qt4')
makedepends=('cmake')
backup=('etc/sni-qt.conf')
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2"{,.asc}
        'sni-qt.conf')
sha512sums=('aa4cffeb3a5a70d65bd5ff42dcdd1c8efd107ade32a104b9a91696aecfb39a7a15d151f7491030ac0d7df796f2c7e4e6c3c0b7e32ee07a7cdc949da757147621'
            'SKIP'
            '41b838b851c88d9dae9d598515c16d1bd8b526af341bd026df8b4d68b07670a05fe33577af73a81c71744da7934507c88fc121a494b53dbbfe3bf24fe9694382')
validpgpkeys=('45C43F82329D77F384214CCABEED35A5EEE34473') # Aurelien Gateau <agateau@kde.org>

prepare() {
  mkdir build

  # Disable building tests
  sed -i '/tests/ d' ${pkgname}-${pkgver}/CMakeLists.txt
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  # Install config file for apps that need "Activate" action
  install -Dm644 "${srcdir}/sni-qt.conf" "${pkgdir}/etc/sni-qt.conf"
}
