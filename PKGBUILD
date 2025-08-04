# Maintainer: artist for the official Xlibre project

pkgname=xlibre-xf86-video-ati
_pkgname=xf86-video-ati
_pkgname2=xfree-xf86-video-ati
pkgver=22.0.0.1
pkgrel=6
pkgdesc="Official XLibre fork of X.Org ati video driver"
arch=('x86_64' 'aarch64')
url="https://github.com/X11Libre"
license=('MIT')
depends=('mesa' 'libpciaccess' 'libdrm' 'glibc')
makedepends=('xlibre-xserver' 'xlibre-xserver-common' 'xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0'
  'xorgproto')
conflicts=(${_pkgname} 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')
provides=(${_pkgname})
groups=('xlibre-drivers')
source=("${url}/${_pkgname}/archive/refs/tags/${_pkgname2}-${pkgver}.tar.gz"
        glamor_egl_init_textured_pixmap.patch)
options=('!debug')

prepare() {
  cd ${_pkgname}-${_pkgname2}-${pkgver}  
  patch -Np1 -i ${srcdir}/glamor_egl_init_textured_pixmap.patch
}

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

  cd ${_pkgname}-${_pkgname2}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd ${_pkgname}-${_pkgname2}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-${_pkgname2}-${pkgver}
  make "DESTDIR=${pkgdir}" install

  install -Dm644 "${srcdir}"/${_pkgname}-${_pkgname2}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('e672335e6c3daaa7869ae59724197a7ae2b43c805e6528395f047302862f6541'
            'ed2e1d51a5fc65975f6d932216112ed585124dec805a54dfb027f84ca3668ed2')

