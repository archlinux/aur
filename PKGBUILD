# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=slim-xdm
_pkgname=slim
pkgver=1.3.6.30
pkgrel=1
pkgdesc="Desktop-independent graphical login manager for X11 with XDM support"
arch=('i686' 'x86_64')
#url="http://slim.berlios.de/"
url="https://github.com/bbidulock/slim"
license=('GPL2')
depends=('libjpeg' 'libxft' 'libxrandr' 'xorg-xauth')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
makedepends=('git' 'cmake' 'freeglut')
backup=('etc/slim.conf' 'etc/pam.d/slim' 'etc/pam.d/slim-greeter'
        'etc/pam.d/slim-autologin' 'etc/slimlock.conf')
source=($pkgname::git://github.com/bbidulock/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's|v||;s|-|.|g;s|[.]g[a-f0-9]*$||'
}

build() {
  cd $pkgname
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_PAM=yes \
    -DUSE_CONSOLEKIT=no
	make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 pam.sample "$pkgdir/etc/pam.d/slim"
  install -Dm644 pam-greeter.sample "$pkgdir/etc/pam.d/slim-greeter"
  install -Dm644 pam-autologin.sample "$pkgdir/etc/pam.d/slim-autologin"
}

# vim:set ts=2 sw=2 et:
