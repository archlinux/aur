# Maintainer: willemw <willemw12@gmail.com>

_pkgname=backintime
pkgname=($_pkgname-git $_pkgname-cli-git)
pkgver=1.1.12.r246.g684211d
pkgrel=2
url="http://backintime.le-web.org"
license=('GPL')
arch=('any')
makedepends=('git' 'openssh' 'python-dbus' 'python-keyring')
source=($_pkgname::git://github.com/bit-team/backintime.git)
md5sums=('SKIP')
# https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
#validpgpkeys=('3E70692EE3DB8BDDA5991C90615F366D944B4826') # Germar Reitze

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

#check() {
#  cd $_pkgname/common
#  make test
#}

package_backintime-cli-git() {
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

package_backintime-git() {
  pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault. QT5 GUI version."
  #depends=('backintime-cli'    'libnotify' 'polkit' 'python-dbus' 'python-pyqt5' 'xorg-xdpyinfo')
  depends=('backintime-cli-git' 'libnotify' 'polkit' 'python-dbus' 'python-pyqt5' 'xorg-xdpyinfo')
  optdepends=('meld: diff tool' 'kompare: diff tool'
              'python-secretstorage: store passwords')
  provides=($_pkgname)
  conflicts=($_pkgname $_pkgname-gnome $_pkgname-gtk $_pkgname-kde4 $_pkgname-qt4 $_pkgname-qt5)

  cd $_pkgname/qt4
  make DESTDIR="$pkgdir" install 
}

