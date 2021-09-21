# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>
pkgname=ckb-next
pkgver=0.4.4
pkgrel=3
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
source=("https://github.com/ckb-next/$pkgname/archive/v$pkgver.tar.gz"
        'dc4dc54c5ebac7e4b455d8df35076fc044a581a7.patch'
        'c2c12fc981458ca59d515dc5d9c007ea78f141ef.patch')
sha256sums=('6946bd035cdbbbd2f139e543d2ca84ba422176c62c3a3665b544118dc6d618d0'
            'ca662407404a0b22c3f2706f729717ab73575101247689ce80b7528fea0de87e'
            '97d56be2873f61d54518e4fa8fdc429ca48a8c5b53ed907ec9abdb08a3bbad0b')

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
  patch -p1 -i "$srcdir/dc4dc54c5ebac7e4b455d8df35076fc044a581a7.patch"
  patch -p1 -i "$srcdir/c2c12fc981458ca59d515dc5d9c007ea78f141ef.patch"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" cmake --build build --target install
}
