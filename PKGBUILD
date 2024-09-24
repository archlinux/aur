# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Julien Taverna <jujudusud gmail com>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgbase=jamulus
pkgname=(jamulus jamulus-headless)
pkgver=3.11.0
pkgrel=1
pkgdesc="Internet jam session software"
arch=(aarch64 x86_64)
url='https://jamulus.io/'
license=(GPL-2.0-only BSD-3-Clause custom:STK)
depends=(gcc-libs qt6-base)
provides=(jamulus-server)
conflicts=(jamulus-git)
makedepends=(jack qt6-multimedia qt6-tools)
groups=(pro-audio)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jamulussoftware/$pkgbase/archive/r${pkgver//./_}.tar.gz"
  'jamulus.service'
  'jamulus.sysusers')
sha256sums=('4ba7980ad5b01adf21a4ab9ddd4ca402fd5141e4eda1996b00f3689be6241250'
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
