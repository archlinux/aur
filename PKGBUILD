# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: makz <contact+aur@makz.me>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>

pkgname=ckb-next-git
pkgver=0.4.2.r12.g0c4015e
pkgrel=1
epoch=1
pkgdesc="Corsair Keyboard and Mouse Input Driver, git master branch"
arch=('i686' 'x86_64')
url="https://github.com/ckb-next/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme' 'quazip' 'qt5-tools')
makedepends=('git' 'cmake')
optdepends=('libappindicator-gtk2: Ayatana indicators in Unity, KDE or Systray (GTK+ 2 library)' 'libpulse')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next')
provides=('ckb-next')
install=ckb-next-git.install
source=('ckb-next-git::git+https://github.com/ckb-next/ckb-next.git')
md5sums=('SKIP')

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
}
