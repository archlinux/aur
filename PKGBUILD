# Maintainer: artist for the official Xlibre project

pkgname=xlibre-xf86-input-evdev
_pkgname=xf86-input-evdev
pkgver=2.11.0.1
pkgrel=5
pkgdesc="Official XLibre fork of X.Org evdev input driver"
arch=(x86_64 aarch64)
url="https://github.com/X11Libre"
license=('HPND-sell-variant AND MIT')
depends=('xlibre-xserver' 'mtdev' 'libevdev' 'glibc')
makedepends=('xlibre-xserver' 'xlibre-xserver-common' 'xlibre-xserver-devel' 'X-ABI-XINPUT_VERSION=26.0'
  'xorgproto')
conflicts=(${_pkgname})
provides=(${_pkgname})
groups=('xlibre-drivers')
source=("${url}/${_pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
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
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('960c13c202dcb029dc15806dd9cff98a773cbc5aa6c20a1c9a53e35ed6d74bef')

