# Maintainer: artist for the official Xlibre project

pkgname=xlibre-xf86-input-libinput-preupgrade
_orgpkgname=xlibre-xf86-input-libinput
_pkgname=xf86-input-libinput
pkgver=1.5.0.0
_pkgver=1.5.0.1
pkgrel=5
pkgdesc="Official Xlibre fork of X.Org generic input driver for the xorg server based on libinput - ONLY for UPGRADES"
arch=('x86_64' 'aarch64')
license=('MIT')
url="https://github.com/X11Libre"
depends=('libinput' 'glibc')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION' 
  'libxi' 'libx11' 'xorgproto' 'libxfont2')
conflicts=(${_pkgname} ${_orgpkgname} 'xorg-server<1.19.0')
provides=(${_pkgname} ${_orgpkgname})
source=("${url}/${_pkgname}/archive/refs/tags/${_orgpkgname}-${_pkgver}.tar.gz")
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

  cd ${_pkgname}-${_orgpkgname}-${_pkgver}
  ./autogen.sh
  ./configure --prefix=/usr \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgname}-${_orgpkgname}-${_pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-${_orgpkgname}-${_pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('21f1f8b07623154bb8329098695d21b36888b15a882418bb58450d30e5e1b423')
