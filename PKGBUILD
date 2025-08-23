# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  artist for XLibre

_basename="xf86-video-ati"
pkgname="${_basename//xf86/xlibre}"
pkgver=22.0.0.2
pkgrel=1
pkgdesc="XLibre ati video driver"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('MIT')
depends=('glibc' 'libdrm>=2.4.89' 'libpciaccess>=0.8' 'mesa' 'systemd-libs')
makedepends=('systemd' 'xlibre-xserver-devel' 'xorgproto' 'X-ABI-VIDEODRV_VERSION=28.0')
# provides=("${_basename}")
conflicts=("${_basename}" 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
_pkgsrc="${_basename}-xlibre-${_basename}-${pkgver}"
source=("https://codeload.github.com/X11Libre/${_pkgname}/tar.gz/refs/tags/${pkgname}-${pkgver}")
b2sums=('5318272d643f9c4717e84d5198448167dc9df8256fa8ac3a10f2989f65e0ba944b0d71e6b53417b97e6606488e1c9a0f3048b902811e32e36dbc70b0024a1817')

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, modules fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS="${CFLAGS/-fno-plt}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt}"
  export LDFLAGS="${LDFLAGS/-Wl,-z,now}"
  local configure_options=(
    --prefix='/usr'
    --enable-glamor
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
