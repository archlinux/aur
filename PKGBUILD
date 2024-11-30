# Maintainer: Dan McCurry <dan dot mc at proton mail dot com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Eric Lehmann <katyl@katyl.info>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Pablo Lezeta <prflr88@gmail.com>

pkgname=iio-sensor-proxy-tuxedo-git
pkgver=3.5.5tux1.cfeee94
pkgrel=1
pkgdesc="IIO accelerometer sensor to input device proxy with Tuxedo patches"
arch=('x86_64')
url="https://gitlab.com/tuxedocomputers/development/tuxedo_os/tuxedo-packages/iio-sensor-proxy"
license=('GPL-2.0-or-later')
depends=('systemd' 'libgudev' 'glib2' 'polkit')
makedepends=('git' 'gtk3' 'meson')
provides=("${pkgname%-tuxedo-git}")
conflicts=("${pkgname%-tuxedo-git}")
install="${pkgname}.install"
source=("git+https://gitlab.com/tuxedocomputers/development/tuxedo_os/tuxedo-packages/iio-sensor-proxy.git"
	"${pkgname}.install")
sha256sums=('SKIP'
            '1afad7b6a787a70d7f127933b0fe7c26e685f140e528c4bd4735b5b6fae627a9')

pkgver() {
  cd "${srcdir}/${pkgname%-tuxedo-git}"
  
  printf "%s.%s" "$(head -n 1 debian/changelog | sed -e 's/.*(\(.*\)).*/\1/' -e 's/-/\./g')" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-tuxedo-git}"
  patch -p1 -i "debian/patches/iio-sensor-proxy-base35.patch"
}

build() {
  mkdir -p "${srcdir}/${pkgname%-tuxedo-git}/build"
  cd "${pkgname%-tuxedo-git}/build"
  
  arch-meson .. \
    -Dsystemdsystemunitdir=/usr/lib/systemd/system \
    -Dudevrulesdir=/usr/lib/udev/rules.d \
    -Dsysconfdir=/usr/share

  ninja
}

package() {
  cd "${srcdir}/${pkgname%-tuxedo-git}/build"

  DESTDIR="$pkgdir" ninja install

  install -Dm644 "${srcdir}/${pkgname%-tuxedo-git}/debian/watch-sensors.service" "${pkgdir}/usr/lib/systemd/system/watch-sensors.service"
}
