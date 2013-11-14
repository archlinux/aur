# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=slim-xdm
_pkgname=slim
pkgver=1.3.6
pkgrel=2
pkgdesc="Desktop-independent graphical login manager for X11 with XDM support"
arch=('i686' 'x86_64')
url="http://slim.berlios.de/"
license=('GPL2')
depends=('pam' 'libxmu' 'libpng' 'libjpeg' 'libxft' 'libxrandr' 'xorg-xauth')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
replaces=($_pkgname 'wdm-slim')
makedepends=('cmake' 'freeglut')
backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim')
source=(http://download.berlios.de/$_pkgname/$_pkgname-$pkgver.tar.gz
        slim-$pkgver.patch
        slim.pam
        slim.logrotate)
sha256sums=('21defeed175418c46d71af71fd493cd0cbffd693f9d43c2151529125859810df'
            'fedc89cc91d7aa5e87970d4541f70199990801d68ac9db7aef14079400c4b3f6'
            'b9a77a614c451287b574c33d41e28b5b149c6d2464bdb3a5274799842bca51a4'
            '5bf44748b5003f2332d8b268060c400120b9100d033fa9d35468670d827f6def')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Fix installation path of slim.service
  sed -i 's|set(LIBDIR "/lib")|set(LIBDIR "/usr/lib")|' CMakeLists.txt

  patch -Np1 -i "$srcdir/slim-1.3.6.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_PAM=yes \
    -DUSE_CONSOLEKIT=no
	make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim"
  install -Dm644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim"

  # Provide sane defaults
  sed -i -e 's|#xserver_arguments.*|xserver_arguments -nolisten tcp vt07|' \
         -e 's|/var/run/slim.lock|/var/lock/slim.lock|' \
    "$pkgdir/etc/slim.conf"
}

# vim:set ts=2 sw=2 et:
