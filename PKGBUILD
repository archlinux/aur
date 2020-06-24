#Maintainer: aig <aigmx@posteo.de>
#Contributor: Jan de Groot <jgc@archlinux.org>

# This PKGBUILD adds constant dpi and pointer limits patches to
# the regular xf86-video-dummy driver package (by Jan de Groot).
# This helps with font rendering issues and unresponsive click
# issues when using xpra. For the patches and further explanations
# see: https://xpra.org/trac/wiki/Xdummy

pkgname=xf86-video-dummy-xpra-patch
_pkgname_orig=${pkgname%-xpra-patch}
pkgver=0.3.8
pkgrel=4
pkgdesc="X.org dummy video driver with xpra constant dpi and pointer limits patches applied"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0' 'xorgproto')
provides=("${_pkgname_orig}=${pkgver}")
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25' 'xf86-video-dummy')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${_pkgname_orig}-${pkgver}.tar.bz2{,.sig}
        "0002-Constant-DPI.patch"
        "0003-fix-pointer-limits.patch")
sha256sums=('3712bb869307233491e4c570732d6073c0dc3d99adfdb9977396a3fdf84e95b9'
            'SKIP'
            'fb9afb69d1bd8afda34975d53ecab98e491798d1d1d3299b03ef7c03f3c90eaa'
            '7cb0cc92da80466fd4ad9ffaae0c7a4be69afe0977939bb51d48f9e3c02736c0')
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C') # Julien Cristau <julien.cristau@ens-lyon.org>

prepare() {
  cd ${_pkgname_orig}-${pkgver}
  patch -p1 -i "${srcdir}/0002-Constant-DPI.patch"
  patch -p1 -i "${srcdir}/0003-fix-pointer-limits.patch"
}

build() {
  cd ${_pkgname_orig}-${pkgver}

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname_orig}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname_orig}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname_orig}/"
}
