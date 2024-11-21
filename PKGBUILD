# Maintainer: Dan McCurry <dan dot mc at proton mail dot com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Eric Lehmann <katyl@katyl.info>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Pablo Lezeta <prflr88@gmail.com>

pkgname=iio-sensor-proxy-tuxedo
pkgver=3.5.5tux1
pkgrel=1
pkgdesc="IIO accelerometer sensor to input device proxy with Tuxedo patches"
arch=('x86_64')
url="https://gitlab.com/tuxedocomputers/development/tuxedo_os/tuxedo-packages/iio-sensor-proxy"
license=('GPL-2.0+')
depends=('systemd' 'libgudev' 'glib2' 'polkit')
makedepends=('gtk3' 'meson')
provides=("${pkgname%-tuxedo}")
conflicts=("${pkgname%-tuxedo}")
source=("https://deb.tuxedocomputers.com/ubuntu/pool/main/i/iio-sensor-proxy/iio-sensor-proxy_${pkgver%.*}.orig.tar.gz"
        "https://deb.tuxedocomputers.com/ubuntu/pool/main/i/iio-sensor-proxy/iio-sensor-proxy_${pkgver%.*}-${pkgver##*.}.debian.tar.xz"
	"${pkgname}.install")
sha256sums=('8689425f2287626a95d95b1e1e5b62e497d09dd08cf411084ed22166d4a49da5'
            '4b04bdedaec13417d25d0ccc2e2c281986fc1e5006c702437cc34d48b5599d67'
            '1afad7b6a787a70d7f127933b0fe7c26e685f140e528c4bd4735b5b6fae627a9')

prepare() {
  cd "${pkgname%-tuxedo}-${pkgver%.*}"
  patch -p1 -i "${srcdir}/debian/patches/iio-sensor-proxy-base35.patch"
}

build() {
  mkdir -p "${pkgname%-tuxedo}-${pkgver%.*}/build"
  cd "${pkgname%-tuxedo}-${pkgver%.*}/build"
  
  arch-meson .. \
    -Dsystemdsystemunitdir=/usr/lib/systemd/system \
    -Dudevrulesdir=/usr/lib/udev/rules.d \
    -Dsysconfdir=/usr/share

  ninja
}

package() {
  cd "${pkgname%-tuxedo}-${pkgver%.*}/build"

  DESTDIR="$pkgdir" ninja install

  install -Dm644 "${srcdir}/debian/watch-sensors.service" "${pkgdir}/usr/lib/systemd/system/watch-sensors.service"
}
