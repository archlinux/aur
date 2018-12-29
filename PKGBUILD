# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: makz <contact+aur@makz.me>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>

pkgname=ckb-next-git
pkgver=0.3.2.r13.g448f337
pkgrel=1
epoch=1
pkgdesc="Corsair Keyboard and Mouse Input Driver, git master branch"
arch=('i686' 'x86_64')
url="https://github.com/ckb-next/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
optdepends=('libappindicator-gtk2: Ayatana indicators in Unity, KDE or Systray (GTK+ 2 library)')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next')
provides=('ckb-next')
install=ckb-next-git.install
source=('ckb-next-git::git+https://github.com/ckb-next/ckb-next.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-VCS}"
  # based only on annotated tags, always has long version as it's a rolling release
  # discards v, replaces dashes with dots
  # NOTE: for one release, 0.3.0, annotated tags are missing, thus --tags is used
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/${pkgname%-VCS}"

  cmake -H. -Bbuild                  \
    -DCMAKE_INSTALL_PREFIX="/usr"    \
    -DCMAKE_BUILD_TYPE="Release"     \
    -DCMAKE_INSTALL_LIBDIR="lib"     \
    -DCMAKE_INSTALL_LIBEXECDIR="lib" \
    -DDISABLE_UPDATER=1
  cmake --build build --target all
}

package() {
  cd "$srcdir/${pkgname%-VCS}"

  DESTDIR="$pkgdir" cmake --build build --target install
}
