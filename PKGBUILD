# Maintainer: robertfoster

pkgname=iio-sensor-proxy-git
pkgver=3.3.r28.e4f0e05
pkgrel=1
pkgdesc="IIO accelerometer sensor to input device proxy"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/hadess/iio-sensor-proxy"
license=('GPL2')
provides=('iio-sensor-proxy')
conflicts=('iio-sensor-proxy')
depends=('libgudev' 'gtk3' 'polkit' 'systemd')
makedepends=('git' 'meson')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  if [ ! -d "${pkgname%%-git}/build" ]; then
    mkdir ${pkgname%%-git}/build
  fi
}

build() {
  cd ${pkgname%%-git}/build

  arch-meson .. \
    -Dsystemdsystemunitdir=/usr/lib/systemd/system \
    -Dudevrulesdir=/usr/lib/udev/rules.d \
    -Dsysconfdir=/usr/share

  ninja
}

package() {
  cd ${pkgname%%-git}/build

  DESTDIR="${pkgdir}" ninja install
}
