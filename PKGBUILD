# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.5.3
pkgrel=2
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
#checkdepends=(openssh python-dbus rsync systemd python-pyfakefs oxygen-icons python-pylint)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba4b28bd9b2f4dd0dae90a1a990ac352880546bb82db3a6176568be3f9de4f46')

#prepare() {i
#  cd "$_pkgname-$pkgver"
#}

build() {
  cd "$_pkgname-$pkgver/common"
  ./configure --python
  make

  cd "$srcdir/$_pkgname-$pkgver/qt"
  ./configure --python
  make
}

#check() {
#  cd "$_pkgname-$pkgver/common"
#  make test
#}

package_backintime-cli() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. CLI version."
  depends=(cron openssh python-dbus python-keyring rsync python-packaging)
  optdepends=('backintime: Qt6 GUI version')

  cd "$_pkgname-$pkgver/common"
  make DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr
}

package_backintime() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. Qt5 GUI version."
  depends=("backintime-cli=$pkgver" polkit python-dbus python-pyqt6 xorg-xdpyinfo sshfs)
  # note users can optionally install EITHER kompare OR meld but not both!
  optdepends=('kompare: diff/patch frontend'
  'meld: diff/patch frontend'
  'qt6-translations: translate BIT dialogs into native language')
  install=backintime.install

  cd "$_pkgname-$pkgver/qt"
  make DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr
}

# vim:set ts=8 sts=2 sw=2 et:
