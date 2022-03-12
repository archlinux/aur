# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.3.2
pkgrel=1
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
checkdepends=(openssh python-dbus rsync systemd)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz")
b2sums=('64d312ca8f140bf42ed8d41cb915adc8e181e535e13f9a2b2f1cee9c8ab18254df15604b869f98e5978cb204d558eaf602ea3d158a52527843ba2c045d702545')

#prepare() {
#  cd "$_pkgname-$pkgver"
#  patch -p1 -i ../
#}

build() {
  cd "$_pkgname-$pkgver/common"
  ./configure --python --no-fuse-group
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
  depends=('cron' 'fuse2' 'openssh' 'python-dbus' 'python-keyring' 'rsync')
  optdepends=('backintime: QT5 GUI version'
  'encfs: encrypted filesystem in user-space'
  'pm-utils: for laptops allows an option to not snapshot on battery'
  'sshfs: FUSE client based on the ssh file transfer protocol')

  cd "$_pkgname-$pkgver/common"
  make DESTDIR="$pkgdir" install
}

package_backintime() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. QT5 GUI version."
  depends=("backintime-cli=$pkgver" 'libnotify' 'polkit' 'python-dbus' 'python-pyqt5' 'xorg-xdpyinfo')
  # note users can optionally install EITHER kompare OR meld but not both!
  optdepends=('kompare: diff/patch frontend'
  'meld: diff/patch frontend'
  'python-keyring: store and access passwords safely')

  cd "$_pkgname-$pkgver/qt"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
