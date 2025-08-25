# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  artist for XLibre

_basename="xf86-input-synaptics"
pkgname="${_basename//xf86/xlibre}"
pkgver=1.10.0.2
pkgrel=1
pkgdesc="XLibre Synaptics driver for notebook touchpads"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('MIT')
depends=('glibc' 'libevdev>=0.4' 'libx11' 'libxi' 'libxtst')
makedepends=('xlibre-xserver-devel' 'xorgproto' 'X-ABI-XINPUT_VERSION=26.0')
provides=("${_basename}" 'synaptics')
conflicts=("${_basename}" 'synaptics' 'xorg-server<21.1.2' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
replaces=('synaptics')
groups=('xlibre-drivers')
install="${pkgname}.install"
_pkgsrc="${_basename}-xlibre-${_basename}-${pkgver}"
#source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/xlibre-${_basename}-${pkgver}.tar.gz")
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${_pkgsrc}.tar.gz")
b2sums=('6c3dbfbf0feaf35cb5dcfa9aa7f87c9ae64c625f18143dd08a523873595ed8ca98c57e62fe8bb631dfcbcdc85c199e956dd5f67ed87cf22ffa1c9f455f78c65d')

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
