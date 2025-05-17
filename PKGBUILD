# Maintainer: willemw <willemw12@gmail.com>

_pkgname=backintime-git
_pkgname_cli=backintime-cli-git
pkgname=($_pkgname $_pkgname_cli)
pkgver=1.4.3.r54.g50c74444
pkgrel=1
url=https://github.com/bit-team/backintime
license=(GPL-2.0-or-later)
arch=(any)
makedepends=(asciidoctor git man-db python) # mkdocs mkdocs-material
#checkdepends=(openssh python-dbus python-pyfakefs python-pylint rsync systemd)
install=$_pkgname.install
source=($_pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i 's/^\(update_man_page common.*\)/#\1/' "$_pkgname/updateversion.sh"
  sed -i 's/^\(update_man_page qt.*\)/#\1/' "$_pkgname/updateversion.sh"
}

build() {
  cd "$srcdir/$_pkgname/common"
  ./configure --python
  make

  cd "$srcdir/$_pkgname/qt"
  ./configure --python
  make
}

#check() {
#  # Isolate some tests, accessing files in ~/.ssh/, etc.
#  HOME=$srcdir/tmp
#  export XDG_CACHE_HOME=$HOME/.cache
#  mkdir -p "$XDG_CACHE_HOME"
#
#  make -C $_pkgname/common test
#  make -C $_pkgname/qt test
#
#  rm -rf $_pkgname/common/tmp
#}

package_backintime-cli-git() {
  pkgdesc='Simple backup/snapshot system inspired by Flyback and TimeVault. CLI version'
  depends=(cron fuse2 openssh python-dbus python-keyring python-packaging rsync)
  #'ecryptfs-utils: verify home encryption'
  optdepends=(
    'encfs: encrypted filesystems'
    'sshfs: remote filesystems')
  provides=("${_pkgname_cli%-git}")
  conflicts=("${_pkgname_cli%-git}")

  make -C $_pkgname/common DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir/usr"
  python -O -m compileall -d /usr "$pkgdir/usr"
}

package_backintime-git() {
  pkgdesc='Simple backup/snapshot system inspired by Flyback and TimeVault. Qt6 GUI version'
  #depends=("${_pkgname_cli%-git}" libnotify polkit python-dbus python-pyqt6 xorg-xdpyinfo)
  depends=($_pkgname_cli libnotify polkit python-dbus python-pyqt6 xorg-xdpyinfo)
  # NOTE: Users can optionally install either kompare or meld but not both
  ##'python-secretstorage: store passwords'
  optdepends=(
    'kompare: diff tool'
    'meld: diff tool'
    'oxygen-icons: fallback icons'
    'python-keyring: store passwords'
    'qt6-translations: translate dialogs'
    'qt6-wayland: wayland support')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  make -C $_pkgname/qt DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir/usr"
  python -O -m compileall -d /usr "$pkgdir/usr"
}
