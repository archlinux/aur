# Maintainer: willemw <willemw12@gmail.com>

_pkgname=backintime
pkgname=($_pkgname-git $_pkgname-cli-git)
pkgver=1.3.2.r111.g6fc658dd
pkgrel=1
url="https://github.com/bit-team/backintime"
license=('GPL')
arch=('any')
makedepends=('git' 'openssh' 'python-dbus' 'python-keyring' 'rsync' 'systemd' 'xorg-xdpyinfo')
checkdepends=('python-pyfakefs' 'python-pyqt5')
source=($_pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  # Set HOME to isolate some tests, which accesses files in ~/.ssh/, etc.
  HOME=tmp make -C $_pkgname/common test
  rm -rf $_pkgname/common/tmp
}

package_backintime-cli-git() {
  pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault. CLI version."
  depends=('cron' 'fuse2' 'openssh' 'python-dbus' 'python-keyring' 'python-packaging' 'rsync')
  #'ecryptfs-utils: verify home encryption'
  optdepends=('encfs: encrypted filesystems'
              'sshfs: remote filesystems')
  provides=($_pkgname-cli)
  conflicts=($_pkgname-cli)

  make -C $_pkgname/common DESTDIR="$pkgdir" install
}

package_backintime-git() {
  pkgdesc="Simple backup/snapshot system inspired by Flyback and TimeVault. Qt5 GUI version."
  #depends=('backintime-cli'    'libnotify' 'polkit' 'python-dbus' 'python-pyqt5' 'xorg-xdpyinfo')
  depends=('backintime-cli-git' 'libnotify' 'polkit' 'python-dbus' 'python-pyqt5' 'xorg-xdpyinfo')
  optdepends=('kompare: diff tool'
              'meld: diff tool'
              'python-secretstorage: store passwords')
  provides=($_pkgname)
  conflicts=($_pkgname)

  make -C $_pkgname/qt DESTDIR="$pkgdir" install
}

