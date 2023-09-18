# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.4.0
pkgrel=4
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
checkdepends=(openssh python-dbus rsync systemd python-pyfakefs oxygen-icons)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
         0001-Start-of-new-dev-version-v1.4.1.patch::https://github.com/bit-team/backintime/commit/5202a3e46c134756a5ecd883947fa4d9ed2d557f.patch
         0002-fix-Set-show-hidden-files-button-value-before-connec.patch::https://github.com/bit-team/backintime/commit/37018e0eaf342a7431d69ee0c571405d610500f2.patch)
sha256sums=('97227a2e5926f08e37bca3fa325e9017b29fe991612340666a376e2eb8804885'
            'fa1f3785f78ddff02bcb4e2ef434d4dae5990a1d36600373b30ba67e8e15ed4e'
            'b918ebc11d94cbbcee1e5a1c62f2f74e82874546bc70e6b178dc7e61595623b6')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../0001-Start-of-new-dev-version-v1.4.1.patch
  patch -p1 -i ../0002-fix-Set-show-hidden-files-button-value-before-connec.patch
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
  'qt5-translation: translate BIT dialogs into native language')

  cd "$_pkgname-$pkgver/qt"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
