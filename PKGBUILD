# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: makz <contact+aur@makz.me>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>

pkgname=ckb-next-git
pkgver=0.5.0.r0.g519330ed
pkgrel=1
epoch=1
pkgdesc="Corsair Keyboard and Mouse Input Driver, git master branch"
arch=('i686' 'x86_64')
url="https://github.com/ckb-next/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme' 'quazip-qt5' 'qt5-tools' 'libxcb' 'xcb-util-wm' 'qt5-x11extras' 'libdbusmenu-qt5' 'python3' 'python-pyqt5')
makedepends=('git' 'cmake')
optdepends=('libpulse')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next')
provides=('ckb-next')
install=ckb-next-git.install
source=('ckb-next-git::git+https://github.com/ckb-next/ckb-next.git'
        'AUR-wrapper::git+https://github.com/ckb-next/AUR-wrapper.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-VCS}"
  # based only on tags, always has long version as it's a rolling release
  # discards v, replaces dashes with dots
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/${pkgname%-VCS}"

  cmake -H. -Bbuild                               \
    -DCMAKE_INSTALL_PREFIX="/usr"                 \
    -DCMAKE_BUILD_TYPE="Release"                  \
    -DCMAKE_INSTALL_LIBDIR="lib"                  \
    -DCMAKE_INSTALL_LIBEXECDIR="lib"              \
    -DDISABLE_UPDATER=1                           \
    -DUDEV_RULE_DIRECTORY="/usr/lib/udev/rules.d" \
    -DFORCE_INIT_SYSTEM="systemd"
  cmake --build build --target all
}

package() {
  cd "$srcdir/${pkgname%-VCS}"

  DESTDIR="$pkgdir" cmake --build build --target install

  # Rename the real binary and add the wrapper
  mv "$pkgdir/usr/bin/ckb-next" "$pkgdir/usr/bin/ckb-next.real"

  cd "$srcdir/AUR-wrapper"
  install -Dm755 AUR_wrapper.py "$pkgdir/usr/bin/ckb-next"
}
