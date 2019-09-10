# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alcasa Mz <alcasa.mz@gmail.com>

pkgname=sni-qt
pkgver=0.2.7+17.04.20170112
pkgrel=1
pkgdesc='Qt4 plugin which turns all QSystemTrayIcon into StatusNotifierItems (appindicators)'
arch=('x86_64')
url='https://launchpad.net/sni-qt'
license=('LGPL3')
depends=('libdbusmenu-qt4')
makedepends=('cmake')
backup=('etc/sni-qt.conf')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${pkgname}/${pkgver}-0ubuntu1/${pkgname}_${pkgver}.orig.tar.gz"
        'sni-qt.conf')
sha512sums=('2636a0b7eb66e5e46e160dfccd93c47ce8accafcb2e46503b4b472735cd97a478c4ce727d5d6451ef2f72b9652296c6da1483ea2b22150d32be340ac223b1f80'
            '41b838b851c88d9dae9d598515c16d1bd8b526af341bd026df8b4d68b07670a05fe33577af73a81c71744da7934507c88fc121a494b53dbbfe3bf24fe9694382')

prepare() {
  mkdir -p ${srcdir}/build

  # Disable building tests
  sed -i '/tests/ d' ${srcdir}/CMakeLists.txt
}

build() {
  cd ${srcdir}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install

  # Install config file for apps that need "Activate" action
  install -Dm644 "${srcdir}/sni-qt.conf" "${pkgdir}/etc/sni-qt.conf"
}
