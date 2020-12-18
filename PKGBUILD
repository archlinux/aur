# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>
pkgname=ckb-next
pkgver=0.4.3
pkgrel=1
pkgdesc="Corsair Keyboard and Mouse Input Driver, release version"
arch=('i686' 'x86_64')
url="https://github.com/ckb-next/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme' 'quazip' 'qt5-tools' 'libxcb' 'xcb-util-wm' 'qt5-x11extras' 'libdbusmenu-qt5')
makedepends=('git' 'cmake')
optdepends=('libpulse')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next-git')
provides=('ckb-next')
install=ckb-next.install
source=("https://github.com/ckb-next/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e4fbd14227ecc63fad9eaf705ca61defd7b44bcaa3ad29aae18cd8a69bbc9ef9')

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

#prepare() {
#  cd "$srcdir/${pkgname}-${pkgver}"
#  patch -p1 -i "$srcdir/a9f41cd8b8f5b04c0c66c6d94f96a9725943831e.patch"
#}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" cmake --build build --target install
}
