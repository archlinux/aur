# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>

pkgname=xlibre-video-dummy-with-vt
pkgver=25.0.0
pkgrel=5
pkgdesc="XLibre dummy video driver with an allocated vt"
arch=(x86_64 aarch64)
_pkgname=xf86-video-dummy
url="https://github.com/X11Libre/${_pkgname}"
license=('MIT' 'X11')
depends=("xlibre-xserver>=${pkgver%.*}" 'glibc')
makedepends=("xlibre-xserver-devel>=${pkgver%.*}" 'xorgproto')
conflicts=("${_pkgname}")
provides=("${_pkgname}" 'x11win-video-dummy')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz"
        "dummy_driver.patch")
groups=('xlibre-drivers')
sha256sums=('b56e610705cd3d4d86422a11c6b0d93357e4d4749a05178a85fd250301d357b9'
            '68cdcf21e9b54a7fdb8e968292e1ef9ad154ddb1361b141a0a635c2a13c92bfa')

prepare() {
  cd "${srcdir}/${_pkgname}-xlibre-${_pkgname}-${pkgver}/src"
  patch -i "${srcdir}/dummy_driver.patch"
}

build() {
  case "$CARCH" in
    "x86_64")
      CFLAGS=" -march=x86-64"
      ;;
    "aarch64")
      CFLAGS=" -march=armv8-a"
      ;;
    *)
      CFLAGS=" -march=native"
      ;;
  esac
  CFLAGS+=" -mtune=generic -O2 -pipe -fexceptions -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security"
  CFLAGS+=" -fstack-clash-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
  LDFLAGS=" -Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,lazy -Wl,-z,relro -Wl,-z,pack-relative-relocs"
  if [[ $CARCH != 'aarch64' ]]; then
    CFLAGS+=" -fcf-protection"
  fi
  CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
  export CFLAGS="${CFLAGS}"
  export CXXFLAGS="${CXXFLAGS}"
  export LDFLAGS="${LDFLAGS}"

  cd "${srcdir}/${_pkgname}-xlibre-${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-xlibre-${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
