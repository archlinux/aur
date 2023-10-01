# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.4.1
pkgrel=1
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
checkdepends=(openssh python-dbus rsync systemd python-pyfakefs oxygen-icons)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd9482f94981b2df0da568e09376a0961e873c37ccf641d4cc91effc810c4e94')

prepare() {
  cd "$_pkgname-$pkgver"
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
  'python-keyring: store and access passwords safely'
  'qt5-translations: translate BIT dialogs into native language')

  cd "$_pkgname-$pkgver/qt"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
