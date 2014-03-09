# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=radegast
pkgver=2.16
pkgrel=1
pkgdesc="Lightweight client for connecting to Second Life and OpenSim worlds"
arch=('i686' 'x86_64')
url="http://radegast.org"
license=('BSD')
depends=('mono')
makedepends=('dos2unix' 'recode')
source=(https://bitbucket.org/radegastdev/${pkgname}/downloads/${pkgname}-${pkgver}-src.zip
        radegast.desktop radegast)
sha256sums=('842496ad3f1f5b5d6c004830322aa35f2b11781d0c0471724830d9cf1d3156d4'
            '8f599f04f263361cd45f7af53cfae633881bfa92ba3f806a0ca675d1ee131567'
            '73cdc80cc4abeb6ba368b09285ff5120ffeb6052a0a5e5ac0febf08c38bb0e96')

build() {
  cd "${srcdir}"/$pkgname-$pkgver-src/$pkgname
  find .. -name \*.sh -exec dos2unix '{}' \;
  bash runprebuild.sh
  xbuild Radegast.sln
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver-src/$pkgname/bin
  find . -type d -print0 | xargs -0 chmod 755
  find . -type f -print0 | xargs -0 chmod 644
  install -dm755 "${pkgdir}"/usr/share/Radegast
  cp -a * "${pkgdir}"/usr/share/Radegast
  install -Dm644 ../Radegast/radegast.png "${pkgdir}"/usr/share/icons/radegast.png
  install -Dm644 "${srcdir}"/radegast.desktop "${pkgdir}"/usr/share/applications/radegast.desktop
  install -Dm755 "${srcdir}"/radegast "${pkgdir}"/usr/bin/radegast

  install -dm755 "${pkgdir}"/usr/share/licenses/radegast
  recode windows-1252..utf8 < ../LICENSE.txt > "${pkgdir}"/usr/share/licenses/radegast/COPYING
}

# vim:set ts=2 sw=2 et:
