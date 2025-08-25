# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  artist for XLibre

_basename="xf86-video-fbdev"
pkgname="${_basename//xf86/xlibre}"
pkgver=0.5.1.2
pkgrel=1
pkgdesc="XLibre framebuffer video driver"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('MIT')
depends=('glibc')
makedepends=('xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0')
provides=("${_basename}")
conflicts=("${_basename}" 'xorg-server<1.20.0' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
groups=('xlibre-drivers')
_pkgsrc="${_basename}-xlibre-${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/xlibre-${_basename}-${pkgver}.tar.gz")
b2sums=('7aab30031d9810984f97cb436eb52cdb96b3aec6006a9374bc029b8da3e78f84c90b6705d94fdf58688ed3f9e47bedfae214b97dddf22475acd536c2c9b76f63')

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

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
