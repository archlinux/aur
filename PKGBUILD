# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Julien Taverna <jujudusud gmail com>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgbase=jamulus
pkgname=(jamulus jamulus-headless)
pkgver=3.10.0
pkgrel=2
pkgdesc="Internet jam session software"
arch=(x86_64 aarch64)
url='https://jamulus.io/'
license=(GPL2 BSD custom:STK)
depends=(gcc-libs qt6-base)
provides=(jamulus-server)
conflicts=(jamulus-git)
makedepends=(jack qt6-multimedia)
groups=(pro-audio)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jamulussoftware/$pkgbase/archive/r${pkgver//./_}.tar.gz"
  'jamulus.service'
  'jamulus.sysusers')
sha256sums=('671ce57431da1ffa701824cf945910f66f31a0260d08944a7d94bf2c67641f0c'
            '98e45f7f877dbc9f8113d63b6e009ff1025e73e1cce86f671b57474a4764e11f'
            '4117ad3a93b3211f679f93794b308ad292d1799a86f85a6b353cfdff8515e2f9')
_pkgsrc=$pkgbase-r${pkgver//./_}

build() {
  cd $_pkgsrc
  qmake6 "CONFIG+=serveronly headless" TARGET=jamulus-headless
  make clean
  make
  qmake6 "CONFIG+=noupcasename"
  make clean
  make
}

package_jamulus() {
  cd $_pkgsrc
  pkgdesc+=" (client and server)"
  depends+=(hicolor-icon-theme libjack.so qt6-multimedia)
  install -vDm755 jamulus -t "$pkgdir"/usr/bin
  install -vDm644 ChangeLog README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 linux/Jamulus.1 "$pkgdir"/usr/share/man/man1/jamulus.1
  install -vDm644 linux/jamulus{,-server}.desktop -t "$pkgdir"/usr/share/applications
  install -vDm644 src/res/io.jamulus.jamulus{,server}.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  install -vDm644 ../jamulus.service -t "$pkgdir"/usr/lib/systemd/system
  install -vDm644 ../jamulus.sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgbase.conf
}

package_jamulus-headless() {
  # prevent conflict when installing all pro-audio packages
  groups=()
  cd $_pkgsrc
  pkgdesc+=" (headless server)"
  conflicts+=(jamulus)
  install -vDm755 jamulus-headless "$pkgdir"/usr/bin/jamulus
  install -vDm644 ChangeLog README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 ../jamulus.service -t "$pkgdir"/usr/lib/systemd/system
  install -vDm644 ../jamulus.sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgbase.conf
}
