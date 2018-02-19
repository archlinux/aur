# Maintainer: willemw <willemw12@gmail.com>

_pkgname=backintime
pkgname=($_pkgname-git $_pkgname-cli-git)
pkgver=1.1.12.r440.gd0f9b844
pkgrel=1
url="https://github.com/bit-team/backintime"
license=('GPL')
arch=('any')
makedepends=('git' 'openssh' 'python-dbus' 'python-keyring' 'rsync' 'systemd' 'xorg-xdpyinfo')
#checkdepends=('gocryptfs')
source=($_pkgname::git://github.com/bit-team/backintime.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/common"
  ./configure --python3 --no-fuse-group
  make

  cd "$srcdir/$_pkgname/qt"
  ./configure --python3
  make
}

check() {
  cd $_pkgname/common
  LC_ALL=en_US.UTF-8 make test
}

package_backintime-cli-git() {
  pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault. CLI version."
  depends=('cron' 'fuse2' 'openssh' 'python-dbus' 'python-keyring' 'rsync')
  #'gocryptfs: encrypted filesystems'
  optdepends=('encfs: encrypted filesystems'
              'sshfs: remote filesystems')
  provides=($_pkgname-cli)
  conflicts=($_pkgname-cli)

  cd $_pkgname/common
  make DESTDIR="$pkgdir" install 
}

package_backintime-git() {
  pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault. Qt5 GUI version."
  #depends=('backintime-cli'    'libnotify' 'polkit' 'python-dbus' 'python-pyqt5' 'xorg-xdpyinfo')
  depends=('backintime-cli-git' 'libnotify' 'polkit' 'python-dbus' 'python-pyqt5' 'xorg-xdpyinfo')
  optdepends=('kompare: diff tool'
              'python-secretstorage: store passwords'
              'meld: diff tool')
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd $_pkgname/qt
  make DESTDIR="$pkgdir" install 
}

