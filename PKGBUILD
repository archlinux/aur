# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-session-shell-git
pkgver=5.6.3.r9.g36589226
pkgrel=1
pkgdesc='Deepin desktop-environment - session-shell module'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-session-shell"
license=('GPL3')
depends=('deepin-daemon-git' 'deepin-wallpapers-git' 'gsettings-qt' 'liblightdm-qt5' 'startdde-git')
makedepends=('git' 'cmake' 'ninja' 'qt5-tools' 'gtest' 'gmock')
conflicts=('deepin-session-ui<5' 'deepin-session-shell')
provides=('lightdm-deepin-greeter' 'deepin-session-shell')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-session-shell"
        dde-lock.pam)
sha512sums=('SKIP'
            '36fb91a00b57e43e0c3b00b85a8b7bcbf8e7eb2ea908ce81fcb06272e8516ee667feb1c37238067e17fb5bb4b3e3d1cf6778982268ab9873035e38f4748cd968')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's/5\.5//g' CMakeLists.txt tests/lightdm-deepin-greeter/CMakeLists.txt tests/dde-lock/CMakeLists.txt
}

build() {
  cd $pkgname
  cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc
  cmake --build build
}

package() {
  cd $pkgname/build
  DESTDIR="$pkgdir" ninja install

  cd $srcdir
  rm $pkgdir/etc/pam.d/dde-lock
  install -m644 dde-lock.pam $pkgdir/etc/pam.d/dde-lock

  chmod +x "$pkgdir"/usr/bin/deepin-greeter
}
