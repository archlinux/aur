# Maintainer: Gabriel B. Casella <gbc921@gmail.com>
# Contributor: tuxce <tuxce;net@gmail.com>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>

pkgname=yaourt-dev-null-git
pkgver=1.8.1.r26.ga945c4d
pkgrel=1
pkgdesc="A pacman wrapper with extended features and AUR support. Patched to redirect (successfully) makepkg output to /dev/null"
arch=('any')
url="http://www.archlinux.fr/yaourt-en/"
license=('GPL')
depends=('package-query-git' 'pacman>=4.1')
makedepends=('git')
optdepends=('aurvote: vote for your favorite AUR packages'
            'customizepkg: automatically modify PKGBUILD during install/upgrade'
            'rsync: retrieve PKGBUILD from official repositories')
provides=('yaourt' 'yaourt-git')
conflicts=('yaourt' 'yaourt-git')
backup=('etc/yaourtrc')
source=('git+https://github.com/archlinuxfr/yaourt.git')
md5sums=('SKIP')
install=yaourt-dev-null-git.install
_gitname=yaourt

pkgver () {
  cd $_gitname/src
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_gitname/src
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var

  cd lib
  sed -i 's|\(SRCDEST="\$YSRCDEST" y_makepkg -d -o -p \.\/PKGBUILD\)|\1 > \/dev\/null|' pkgbuild.sh.in
  sed -i 's|\(SRCDEST="\$YSRCDEST" PKGDEST="\$YPKGDEST" y_makepkg -s -c -f -p \.\/PKGBUILD\)|\1 > \/dev\/null|' pkgbuild.sh.in
  sed -i -re 's|(\(\( EXPORT \&\& EXPORTSRC \)\) \&\& \[\[ \$SRCPKGDEST \]\] \&\& SRCDEST="\$YSRCDEST" y_makepkg --allsource -c -p \.\/PKGBUILD)|\1 > \/dev\/null|' pkgbuild.sh.in
}

package() {
  cd $_gitname/src
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
