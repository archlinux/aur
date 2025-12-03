# Maintainer: Franco Corbelli <franco at francocorbelli dot com>
# Maintainer: Bastian Plettner <plettner [dot] bastian [atsign] gmail [dot] com>
# Contributor: Lone_Wolf  (bbs.archlinux.org)
# Contributor: Scimmia (bbs.archlinux.org)
# Contributor: Loqs (bbs.archlinux.org)
pkgname=zpaqfranz-git
_pkgname=zpaqfranz
pkgver=63.6.r1.g487e30e
pkgrel=1
epoch=1
pkgdesc="Swiss army knife for backup and disaster recovery, like 7z or RAR on steroids, with deduplicated 'snapshots' (versions). Conceptually similar to the Mac time machine, but much more efficiently. zpaq 7.15 fork"
arch=('i686' 'x86_64')
url="https://github.com/fcorbelli/zpaqfranz"
license=('MIT')
makedepends=('git')
conflicts=('zpaqfranz')
provides=('zpaqfranz')
source=("git+https://github.com/fcorbelli/zpaqfranz.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CCX="${CCX:-g++}"

  cd "${_pkgname}"
  $CCX $CXXFLAGS $LDFLAGS $LTOFLAGS -Dunix zpaqfranz.cpp -o zpaqfranz -pthread

  /usr/bin/gzip -9 -f man/zpaqfranz.1
}

package() {
  cd "${_pkgname}"
  install -Dm 755 zpaqfranz "${pkgdir}/usr/bin/zpaqfranz"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  install -Dm 644 man/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-man-zpaqfranz.1"
  install -Dm 644 man/zpaqfranz.1.gz "${pkgdir}/usr/share/man/man1/zpaqfranz.1.gz"
}
