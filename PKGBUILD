# Maintainer: artist for Xlibre

pkgname=xlibre-xf86-video-amdgpu
_pkgname=xf86-video-amdgpu
pkgver=23.0.0.3
pkgrel=4
pkgdesc="XLibre fork of X.Org amdgpu video driver"
arch=('x86_64' 'aarch64')
url="https://github.com/X11Libre"
license=('MIT')
depends=('mesa' 'libdrm' 'glibc')
makedepends=('xlibre-xserver' 'xlibre-xserver-common' 'xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0')
conflicts=(${_pkgname} 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
provides=(${_pkgname})
source=("${url}/${_pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
groups=('xlibre-drivers')
options=('!debug')

build() {
  if [[ ! "$CFLAGS" == *"-march="* ]]; then
    case "$CARCH" in
      "x86_64")
        CFLAGS+=" -march=x86-64"
        ;;
      "aarch64")
        CFLAGS+=" -march=armv8-a"
        ;;
      *)
        CFLAGS+=" -march=native"
        ;;
    esac
  fi
  CFLAGS+=" -mtune=generic -O2 -pipe -fexceptions -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security"
  CFLAGS+=" -fstack-clash-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
  LDFLAGS=" -Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,lazy -Wl,-z,relro -Wl,-z,pack-relative-relocs"
  if [[ $CARCH == 'aarch64' ]]; then
    CFLAGS=${CFLAGS/-fcf-protection}
  fi
  if [[ "$pkgname" == *"xf86-input"* ]]; then
    CFLAGS+=" -fno-plt"
    LDFLAGS+=" -Wl,-z,now"
  else
    CFLAGS=${CFLAGS/-fno-plt}
  fi
  if [[ "$pkgname" == *"xf86-video-intel"* ]]; then
    CFLAGS=${CFLAGS/-flto*}
    CFLAGS+=" -fno-lto"
    LDFLAGS=${CFLAGS/-flto*}
    LDFLAGS+=" -fno-lto"
  fi
  CXXFLAGS="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"
  export CFLAGS="${CFLAGS}"
  export CXXFLAGS="${CXXFLAGS}"
  export LDLAGS="${LDLAGS}"

  cd ${_pkgname}-${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
    --enable-glamor
  make
}

check() {
  cd ${_pkgname}-${pkgname}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-${pkgname}-${pkgver}
  make "DESTDIR=${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('06e4bd89fa48f43dcfe27a5761ac2283ca41d2bb72e8f4a3af51998b3290ba40')
