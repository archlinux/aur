# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="xf86-input-evdev"
pkgname="${_basename//xf86/xlibre}"
pkgver=2.11.0.1
pkgrel=2
pkgdesc="XLibre evdev input driver"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('HPND-sell-variant AND MIT')
depends=('glibc' 'libevdev>=0.4' 'mtdev' 'systemd-libs')
makedepends=('xlibre-server-devel' 'xorgproto' 'X-ABI-XINPUT_VERSION=26.0')
# provides=("${_basename}")
conflicts=("${_basename}" 'xorg-server<21.1.1' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
groups=('xlibre-drivers')
_pkgsrc="${_basename}-xlibre-${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/xlibre-${_basename}-${pkgver}.tar.gz")
b2sums=('339e23ec883fc5870dd9c6b5e60330e09c7a898aa079892e338bc140f8c5f71f9139114d5986483a55e4ec1ce2f03f74d9cb4c170d11c0471069685545b62585')

build() {
  local configure_options=(
    --prefix='/usr'
  )

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
