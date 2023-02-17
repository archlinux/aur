# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.3.3
pkgrel=3
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
checkdepends=(openssh python-dbus rsync systemd python-pyfakefs oxygen-icons)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d9fc2434e5accf957c0fe0ed7daf7e1a2acb8c1d683612889b277e02be159ec15ed606e7e551e5955e3aa73af7e26f01c26c734d6882cfb926f2d6de2ae79d46')

build() {
  cd "$_pkgname-$pkgver/common"
  ./configure --python --no-fuse-group
  make

  cd "$srcdir/$_pkgname-$pkgver/qt"
  ./configure --python
  make
}

check() {
  cd "$_pkgname-$pkgver/common"
  
  make test
}

package_backintime-cli() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. CLI version."
  depends=(cron fuse2 openssh python-dbus python-keyring rsync python-packaging)
  optdepends=('backintime: QT5 GUI version'
  'encfs: encrypted filesystem in user-space'
  'pm-utils: for laptops allows an option to not snapshot on battery'
  'sshfs: FUSE client based on the ssh file transfer protocol')

  cd "$_pkgname-$pkgver/common"
  make DESTDIR="$pkgdir" install
}

package_backintime() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. QT5 GUI version."
  depends=("backintime-cli=$pkgver" libnotify polkit python-dbus python-pyqt5 xorg-xdpyinfo)
  # note users can optionally install EITHER kompare OR meld but not both!
  optdepends=('kompare: diff/patch frontend'
  'meld: diff/patch frontend'
  'python-keyring: store and access passwords safely')

  cd "$_pkgname-$pkgver/qt"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
