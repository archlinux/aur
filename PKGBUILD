# Maintainer: willemw <willemw12@gmail.com>

_pkgname=backintime
pkgname=($_pkgname-bzr $_pkgname-cli-bzr)
pkgver=r1087
pkgrel=1
url="http://backintime.le-web.org"
license=('GPL')
arch=('any')
makedepends=('bzr')
source=($_pkgname::bzr+https://code.launchpad.net/~bit-team/backintime/trunk)
md5sums=('SKIP')
# https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
#validpgpkeys=('3E70692EE3DB8BDDA5991C90615F366D944B4826') # Germar Reitze

pkgver() {
  cd $_pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $_pkgname
}

build() {
  cd "$srcdir/$_pkgname/common"
  ./configure --python3 --no-fuse-group
  make

  cd "$srcdir/$_pkgname/qt4"
  ./configure --python3
  make
}

package_backintime-cli-bzr() {
  pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault. CLI version."
  depends=('rsync' 'cron' 'openssh' 'python-dbus' 'python-keyring')
  optdepends=('encfs: encrypted filesystems'
              'pm-utils: power management status check'
              'sshfs: remote filesystems')
  provides=($_pkgname-cli)
  conflicts=($_pkgname-cli)

  cd $_pkgname/common
  make DESTDIR="$pkgdir" install 
}

package_backintime-bzr() {
  pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault. QT4 GUI version."
  #depends=('backintime-cli-bzr'=$pkgver 'libnotify' 'polkit' 'python-dbus' 'python-pyqt4' 'xorg-xdpyinfo')
  depends=('backintime-cli' 'libnotify' 'polkit' 'python-dbus' 'python-pyqt4' 'xorg-xdpyinfo')
  optdepends=('meld: diff tool' 'kompare: diff tool'
              'python-secretstorage: store passwords')
  provides=($_pkgname)
  conflicts=($_pkgname $_pkgname-gnome $_pkgname-gtk $_pkgname-kde4 $_pkgname-qt4)

  cd $_pkgname/qt4
  make DESTDIR="$pkgdir" install 
}

