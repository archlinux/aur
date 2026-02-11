# Maintainer: Jose Riha <jose1711 gmail com>
# based on jamulus in AUR

pkgbase=jamulus-git
pkgname=(jamulus-git jamulus-git-headless)
pkgver=r6061.043dafe8
pkgrel=1
pkgdesc="Internet jam session software (git)"
arch=(aarch64 x86_64)
url='https://jamulus.io/'
license=(GPL-2.0-only BSD-3-Clause custom:STK)
depends=(gcc-libs qt6-base)
provides=(jamulus-server)
conflicts=(jamulus)
makedepends=(jack qt6-multimedia qt6-tools git)
groups=(pro-audio)
source=("${pkgname}::git+https://github.com/jamulussoftware/jamulus.git"
       'jamulus.service'
       'jamulus.sysusers')
sha256sums=('SKIP'
            '98e45f7f877dbc9f8113d63b6e009ff1025e73e1cce86f671b57474a4764e11f'
            '4117ad3a93b3211f679f93794b308ad292d1799a86f85a6b353cfdff8515e2f9')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  }

build() {
  cd $pkgbase
  qmake6 "CONFIG+=serveronly headless" TARGET=jamulus-headless
  make clean
  make
  qmake6 "CONFIG+=noupcasename"
  make clean
  make
}

package_jamulus-git() {
  cd $pkgbase
  pkgdesc+=" - client and server"
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

package_jamulus-git-headless() {
  # prevent conflict when installing all pro-audio packages
  groups=()
  cd $pkgbase
  pkgdesc+=" - headless server"
  conflicts+=(jamulus-git)
  install -vDm755 jamulus-headless "$pkgdir"/usr/bin/jamulus
  install -vDm644 ChangeLog README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 ../jamulus.service -t "$pkgdir"/usr/lib/systemd/system
  install -vDm644 ../jamulus.sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgbase.conf
}
