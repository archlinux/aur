# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.4.3
pkgrel=4
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
checkdepends=(openssh python-dbus rsync systemd python-pyfakefs oxygen-icons python-pylint)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
fix.patch)
sha256sums=('89a1d9f1b766025d0219b7978e77ee91a5e25ef99ade164c1d8b5a9a3d273e65'
            '9c0eed1444db54891f4fad9397a892dce6c6962b2a8846b624778514f1769611')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../fix.patch
}

build() {
  cd "$_pkgname-$pkgver/common"
  ./configure --python
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
  depends=(cron openssh python-dbus python-keyring rsync python-packaging)
  optdepends=('backintime: Qt5 GUI version'
  'encfs: encrypted filesystem in user-space')

  cd "$_pkgname-$pkgver/common"
  make DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr
}

package_backintime() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. Qt5 GUI version."
  depends=("backintime-cli=$pkgver" libnotify polkit python-dbus python-pyqt5 xorg-xdpyinfo sshfs)
  # note users can optionally install EITHER kompare OR meld but not both!
  optdepends=('kompare: diff/patch frontend'
  'meld: diff/patch frontend'
  'qt5-translations: translate BIT dialogs into native language')
  install=backintime.install

  cd "$_pkgname-$pkgver/qt"
  make DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr
}

# vim:set ts=8 sts=2 sw=2 et:
