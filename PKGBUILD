# Maintainer: Minzord YT <minzord[AT]caramail dot fr>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>
# Based on the PKGBUILD created by Kirigaya Kazushin <kirigaya@mkacg.com>

pkgname=deepin-terminal-git
pkgver=3.2.7.1.r6.geddc13a
pkgrel=1
pkgdesc='Default terminal emulation application for Deepin'
arch=('i686' 'x86_64')
url="https://github.com/linuxdeepin/deepin-terminal"
license=('GPL3')
depends=('vte3' 'libsecret' 'libgee' 'libwnck3' 'expect' 'deepin-menu')
makedepends=('git' 'vala' 'cmake')
optdepends=('deepin-manual: for help menual'
            'deepin-shortcut-viewer: for shortcut display'
            'zssh: for remote management support')
groups=('deepin-extra')
conflicts=('deepin-terminal')
provides=('deepin-terminal')
source=("git+https://github.com/linuxdeepin/deepin-terminal.git")
sha256sums=('SKIP')

pkgver() {
  cd deepin-terminal
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DTEST_BUILD=OFF \
    -DUSE_VENDOR_LIB=OFF \
    -DVERSION=$pkgver \
    ../deepin-terminal
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  ln -s deepin-terminal "$pkgdir"/usr/bin/x-terminal-emulator
}
