# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  artist for XLibre

_basename="xf86-input-evdev"
pkgname="${_basename//xf86/xlibre}"
pkgver=2.11.0.2
pkgrel=1
pkgdesc="XLibre evdev input driver"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('HPND-sell-variant AND MIT')
depends=('glibc' 'libevdev>=0.4' 'mtdev' 'systemd-libs')
makedepends=('xlibre-xserver-devel' 'xorgproto' 'X-ABI-XINPUT_VERSION=26.0')
provides=("${_basename}")
conflicts=("${_basename}" 'xorg-server<21.1.1' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
groups=('xlibre-drivers')
_pkgsrc="${_basename}-xlibre-${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/xlibre-${_basename}-${pkgver}.tar.gz")
b2sums=('4f126995f5a91f1142ddf2965e4b26b991e956b9bfdfa4095de99c840ffa53f960cc8bcc166790aa01747650e28480c4f438b4ff03cbb0b37a4fe385462cfc2b')

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
