# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>
pkgname=ckb-next
pkgver=0.5.0
pkgrel=2
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
        'AUR-wrapper::git+https://github.com/ckb-next/AUR-wrapper.git'
        '0001-Fix-autostart-checkbox-detection-with-renamed-binary.patch')
sha256sums=('12705aa86cb544a77df6d7a73744f21513bcc6cce805ed8caf5d3b72a950157e'
            'SKIP'
            '6cddbf71179ad385d89b9a2ed318b0fa3dd5817b5bcfd4432d22b088d183bfcd')

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
  patch -p1 -i "$srcdir/0001-Fix-autostart-checkbox-detection-with-renamed-binary.patch"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" cmake --build build --target install

  # Rename the real binary and add the wrapper
  mv "$pkgdir/usr/bin/ckb-next" "$pkgdir/usr/bin/ckb-next.real"

  cd "$srcdir/AUR-wrapper"
  install -Dm755 AUR_wrapper.py "$pkgdir/usr/bin/ckb-next"
}
