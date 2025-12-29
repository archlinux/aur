# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=xlibre-video-amdgpu
pkgver=25.0.0
pkgrel=7
pkgdesc="XLibre fork of X.Org amdgpu video driver"
arch=('x86_64')
_pkgname="${pkgname//xlibre/xf86}"
url="https://github.com/X11Libre/${_pkgname}"
depends=("xlibre-xserver>=${pkgver%.*}" 'glibc')
makedepends=("xlibre-xserver-devel>=${pkgver%.*}" 'xorgproto')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
groups=('xlibre-drivers')
depends+=('mesa' 'libdrm>=2.4.121')
makedepends+=('meson>=0.59.0')

build() {
  export CFLAGS=${CFLAGS/-fno-plt}
  export CFLAGS+=" -Wno-incompatible-pointer-types"
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  arch-meson ${_pkgname}-xlibre-${_pkgname}-${pkgver} build \
    -D udev=enabled \
    -D glamor=enabled \
    -D configdir=/usr/share/X11/xorg.conf.d/  \
    -D moduledir="/usr/lib/xorg/modules/xlibre-${pkgver%%.*}/"

  meson configure build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "${srcdir}"/${_pkgname}-xlibre-${_pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}


xbuild() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  ./autogen.sh
  ./configure --prefix=/usr \
    --enable-glamor
  make
}

xcheck() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make check
}

xpackage() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make "DESTDIR=${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-xlibre-${_pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('2fdf19250d1bfedcb9c4fc4f72a2eb23de90c6ce7bf1b37e2da7ef3410895c18')

