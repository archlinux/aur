# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
_commit=8495f9dc3953343a0352bb3ffbdcfab7f93c10ad
pkgver=1.3.3
pkgrel=2
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
checkdepends=(openssh python-dbus rsync systemd python-pyfakefs)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/$_commit.tar.gz")
b2sums=('5900c265718d3d3fad1ce3e38719c6e12cb435105d0b714a4602e1a541d3610d8cb552e13a1c59acf2bfc67290637fc2aacae971865d67fcfad92ad85a64d161')

prepare() {
  cd "$_pkgname-$_commit"
}

build() {
  cd "$_pkgname-$_commit/common"
  ./configure --python --no-fuse-group
  make

  cd "$srcdir/$_pkgname-$_commit/qt"
  ./configure --python
  make
}

check() {
  cd "$_pkgname-$_commit/common"
  
  make test
}

package_backintime-cli() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. CLI version."
  depends=(cron fuse2 openssh python-dbus python-keyring rsync python-packaging)
  optdepends=('backintime: QT5 GUI version'
  'encfs: encrypted filesystem in user-space'
  'pm-utils: for laptops allows an option to not snapshot on battery'
  'sshfs: FUSE client based on the ssh file transfer protocol')

  cd "$_pkgname-$_commit/common"
  make DESTDIR="$pkgdir" install
}

package_backintime() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. QT5 GUI version."
  depends=("backintime-cli=$pkgver" libnotify polkit python-dbus python-pyqt5 xorg-xdpyinfo)
  # note users can optionally install EITHER kompare OR meld but not both!
  optdepends=('kompare: diff/patch frontend'
  'meld: diff/patch frontend'
  'python-keyring: store and access passwords safely')

  cd "$_pkgname-$_commit/qt"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
