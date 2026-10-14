# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname='psi-git'
pkgver=1.5.r2253.gc6586d5a
pkgrel=1
pkgdesc="Powerful XMPP (Jabber) client (Qt, C++) designed for power users"
url="https://psi-im.org"
license=('GPL2')
arch=('x86_64')
depends=('hunspell' 'minizip' 'qca-qt6' 'qt6-svg' 'libidn' 'libusrsctp' 'qtkeychain-qt6' 'libxss' 'qt6-webengine')
makedepends=('cmake' 'qt6-multimedia' 'git' 'libomemo-c')
conflicts=('psi')
source=("git+https://github.com/psi-im/psi.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/psi"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd psi
  git submodule update --init --recursive
}

build() {
  cd psi
  cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DQT_DEFAULT_MAJOR_VERSION=6 \
    -DCHAT_TYPE=WEBENGINE
  cmake --build build
}

package() {
  cd psi
  DESTDIR="$pkgdir" cmake --install build
  install -dm755 "$pkgdir/usr/include/psi/plugins"
  install -m644 plugins/include/*.h "$pkgdir/usr/include/psi/plugins"
  install -Dm644 linux/psi.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}

