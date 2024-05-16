# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-session-git
_pkgname=dde-session
pkgver=1.2.9.r0.gd07ba25
pkgrel=1
pkgdesc='New DDE session'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-session"
license=('LGPL3')
depends=('systemd-libs'
)
makedepends=('git'
             'qt6-tools'
             'cmake'
             'ninja'
)
conflicts=('deepin-session')
provides=('deepin-session')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dde-session.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  sed -i 's|/etc/os-version|/etc/uos-version|' misc/Xsession.d/00deepin-dde-env
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
