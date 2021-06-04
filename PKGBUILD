# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=('backintime' 'backintime-cli')
_pkgname="backintime"
pkgver=1.2.1
pkgrel=2
arch=('any')
url="https://github.com/bit-team/backintime"
license=('GPL')
makedepends=('python')
#source=("https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz"
  000-PR-1135.patch::https://github.com/bit-team/backintime/commit/9310acc30362907c7d14f3c8c31a0e4a366d44f5.patch
)
b2sums=('a20d22243d7302e4702631b86e4aaf8d1562a485641f11084c5632125eb5be5d52503ad566bcf21d669c4e7a7f9bd4a96b5c47718714cb5fd96fe53c40d2433d'
        '54447b266f1eaa871246e009cf1061d61f4eb612146728b8f637a442b58001990e31bbaf93270f6f594a794b0c188d77dd63a62ec35a58ba836cd043999fb5e5')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np1 -i ../000-PR-1135.patch
}

build() {
  cd "$_pkgname-$pkgver/common"
  ./configure --python --no-fuse-group
  make

  cd "$srcdir/$_pkgname-$pkgver/qt"
  ./configure --python
  make
}

test() {
  cd "$_pkgname-$pkgver/common"
  make test
}

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
