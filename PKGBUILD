# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.4.0
pkgrel=1
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
checkdepends=(openssh python-dbus rsync systemd python-pyfakefs oxygen-icons)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
         pr1536.patch::https://patch-diff.githubusercontent.com/raw/bit-team/backintime/pull/1536.patch)
sha256sums=('97227a2e5926f08e37bca3fa325e9017b29fe991612340666a376e2eb8804885'
            '0e3f87e15a0dd96a8ca0b23c86f4c01329ec76d02900e690075a5b2c135de48c')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../pr1536.patch
}

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
  optdepends=('backintime: Qt5 GUI version'
  'encfs: encrypted filesystem in user-space'
  'pm-utils: for laptops allows an option to not snapshot on battery'
  'sshfs: FUSE client based on the ssh file transfer protocol')

  cd "$_pkgname-$pkgver/common"
  make DESTDIR="$pkgdir" install
}

package_backintime() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. Qt5 GUI version."
  depends=("backintime-cli=$pkgver" libnotify polkit python-dbus python-pyqt5 xorg-xdpyinfo)
  # note users can optionally install EITHER kompare OR meld but not both!
  optdepends=('kompare: diff/patch frontend'
  'meld: diff/patch frontend'
  'python-keyring: store and access passwords safely')

  cd "$_pkgname-$pkgver/qt"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
