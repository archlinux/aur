# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>
pkgname=ckb-next
pkgver=0.6.0
pkgrel=1
pkgdesc="Corsair Keyboard and Mouse Input Driver, release version"
arch=('i686' 'x86_64' 'pentium4')
url="https://github.com/ckb-next/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme' 'quazip-qt5' 'qt5-tools' 'libxcb' 'xcb-util-wm' 'qt5-x11extras' 'libdbusmenu-qt5' 'python3' 'python-pyqt5')
makedepends=('git' 'cmake')
optdepends=('libpulse')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next-git')
provides=('ckb-next')
install=ckb-next.install
source=("https://github.com/ckb-next/$pkgname/archive/v$pkgver.tar.gz"
        'AUR-wrapper::git+https://github.com/ckb-next/AUR-wrapper.git')
sha256sums=('dd7c9a30ce7bf4fafcdfff974c519b2b3d2ff888c99d3255a6e0194ece5056f4'
            'SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  cmake -H. -Bbuild \
    -DCMAKE_INSTALL_PREFIX="/usr"                 \
    -DCMAKE_BUILD_TYPE="Release"                  \
    -DCMAKE_INSTALL_LIBDIR="lib"                  \
    -DCMAKE_INSTALL_LIBEXECDIR="lib"              \
    -DDISABLE_UPDATER=1                           \
    -DUDEV_RULE_DIRECTORY="/usr/lib/udev/rules.d" \
    -DFORCE_INIT_SYSTEM="systemd"
  cmake --build build --target all
}

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" cmake --build build --target install

  # Rename the real binary and add the wrapper
  mv "$pkgdir/usr/bin/ckb-next" "$pkgdir/usr/bin/ckb-next.real"

  cd "$srcdir/AUR-wrapper"
  install -Dm755 AUR_wrapper.py "$pkgdir/usr/bin/ckb-next"
}
