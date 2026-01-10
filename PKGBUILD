# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Roman Porizka <artee@beer.cz>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Semen Soldatov <simplexe@mail.ru>
# Contributor: tee < teeaur at duck dot com >

pkgname=sqliteman
pkgver=1.2.2
pkgrel=13
pkgdesc='Graphical sqlite3 browser and editor'
arch=('i686' 'x86_64')
url='https://github.com/pvanek/sqliteman'
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=('qt5-base' 'qscintilla-qt5')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "0001_qt5.patch"
        "0002_lpthread.patch"
        "0003_icons.patch")
sha256sums=('2229e627528ec02a9cf7aba3a65bef8999272fc25eb22112dc3f8ee583eb5dfb'
            '5cd44c0b5e4387758b3c485365ed97f2f766b69fff893d89767a19eda800f0ff'
            'af99d278b6d0cda9f84487985afdb427f77edd6eff9a1a62edac906dcfd5487b'
            'ba1aee6f1705d08a0507153e457e817bcd86ba65cce4f733b22120fc7acfb956')

prepare() {
  mkdir build

  cd "${pkgname}-${pkgver}"
  patch -p1 -i ../0001_qt5.patch
  patch -p1 -i ../0002_lpthread.patch
  patch -p1 -i ../0003_icons.patch
  sed -i -e 's OLD NEW ' -e 's \\\\  g' CMakeLists.txt
}

build() {
  cd build

  cmake ../"${pkgname}-${pkgver}" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  make -Cbuild DESTDIR="${pkgdir}" install
}
