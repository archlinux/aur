# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="xf86-video-voodoo"
pkgname="${_basename//xf86/xlibre}"
pkgver=1.2.6.1
pkgrel=2
pkgdesc="XLibre 3dfx Voodoo1/Voodoo2 2D video driver"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('MIT')
depends=('glibc')
makedepends=('xlibre-server-devel' 'X-ABI-VIDEODRV_VERSION=28.0')
# provides=("${_basename}")
conflicts=("${_basename}" 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
_pkgsrc="${_basename}-xlibre-${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/xlibre-${_basename}-${pkgver}.tar.gz")
b2sums=('9d55bda5f2380567bd8064eef2fc9022556f4cab928bfc0164f90aebf17636a5ed5e2052d692c0e99375405218e60ce6e8947b1f396cecf1203e92bea7582119')

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, modules fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS="${CFLAGS/-fno-plt}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt}"
  export LDFLAGS="${LDFLAGS/-Wl,-z,now}"
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

  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
