# Maintainer: FennecTECH <fennectech@gmail.com>
# Based uppon the script for radegast written by Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=radegast-git
pkgver=2.18.r125.g6ae2c835
pkgrel=45
pkgdesc="Lightweight client for connecting to Second Life and OpenSim worlds"
arch=('i686' 'x86_64')
url="http://radegast.org"
license=('BSD')
depends=('mono')
conflicts=('radegast')
provides=('radegast')
makedepends=('dos2unix' 'recode' 'git' 'openssl-1.0')
source=("$pkgname::git+https://github.com/radegastdev/radegast.git"
        git+https://github.com/openmetaversefoundation/libopenmetaverse.git
        radegast.desktop
        radegast)
sha256sums=('SKIP'
            'SKIP'
            '8f599f04f263361cd45f7af53cfae633881bfa92ba3f806a0ca675d1ee131567'
            '73cdc80cc4abeb6ba368b09285ff5120ffeb6052a0a5e5ac0febf08c38bb0e96')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.libopenmetaverse.url "$srcdir"/libopenmetaverse
  git submodule update
}

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  find .. -name \*.sh -exec dos2unix '{}' \;
  bash runprebuild.sh
  xbuild Radegast.sln
}

package() {
  cd $pkgname/bin
  find . -type d -print0 | xargs -0 chmod 755
  find . -type f -print0 | xargs -0 chmod 644
  install -dm755 "${pkgdir}"/usr/share/Radegast
  cp -a -- * "${pkgdir}"/usr/share/Radegast
  install -Dm644 ../Radegast/radegast.png "${pkgdir}"/usr/share/icons/radegast.png
  install -Dm644 "${srcdir}"/radegast.desktop "${pkgdir}"/usr/share/applications/radegast.desktop
  install -Dm755 "${srcdir}"/radegast "${pkgdir}"/usr/bin/radegast

  install -dm755 "${pkgdir}"/usr/share/licenses/radegast
  recode windows-1252..utf8 < ../LICENSE.txt > "${pkgdir}"/usr/share/licenses/radegast/COPYING
}

# vim:set ts=2 sw=2 et:
