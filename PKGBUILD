# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Andrew Rabert <ar@nullsum.net>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Vítor Ferreira <vitor.dominor@gmail.com>

pkgname=xboxdrv-git
pkgver=0.8.4.r453.gf8ef7e0
pkgrel=2
pkgdesc="An XBox/XBox 360 gamepad driver - as alternative to the xpad-kernel module - with more configurability, runs in userspace and supports a multitude of controllers"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://xboxdrv.gitlab.io/"
license=(GPL3)
depends=(libx11 dbus-glib libusb bluez-libs gtk3 fmt)
makedepends=(git cmake boost)
provides=(xboxdrv)
conflicts=(xboxdrv)
source=("git+https://gitlab.com/xboxdrv/xboxdrv.git"
        "git+https://gitlab.com/argparser/argparser.git"
        "git+https://github.com/google/googletest.git"
        "xboxdrv.service"
        "xboxdrv.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '51387a52a97d2e004a4160432131f18326e9ae655447694e170f18bdb8d7204f'
            'f155dd059faecafa60ecaa0988aec815ee0c58f1af45075de82ae10c31db2750')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir -p build
  git submodule init
  git config submodule.external/argparser.url "$srcdir/argparser"
  git config submodule.external/googletest.url "$srcdir/googletest"
  git submodule update
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=ON
  make
}

check() {
  cd "${pkgname%-git}/build"
  make test
}

package() {
  cd "${pkgname%-git}/build"
  make install DESTDIR="$pkgdir"

  install -D -m755 "$srcdir/xboxdrv.service" "$pkgdir/usr/lib/systemd/system/xboxdrv.service"
  install -D -m644 "$srcdir/xboxdrv.conf" "$pkgdir/etc/conf.d/xboxdrv"
}
