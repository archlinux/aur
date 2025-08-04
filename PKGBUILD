# Maintainer: artist for the official Xlibre project

pkgname=xlibre-xf86-input-synaptics
_pkgname=xf86-input-synaptics
pkgver=1.10.0.1
_pkgver=1.10.0
pkgrel=5
pkgdesc="Official XLibre fork of X.Org Synaptics driver for notebook touchpads"
arch=('x86_64' 'aarch64')
license=('MIT')
url="https://github.com/X11Libre"
depends=('libxtst' 'libevdev' 'libx11' 'libxi' 'glibc')
makedepends=('xlibre-xserver' 'xlibre-xserver-common' 'xlibre-xserver-devel' 'X-ABI-XINPUT_VERSION=26.0'
  'xorgproto')
conflicts=(${_pkgname} 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27' 'synaptics')
replaces=('synaptics')
provides=(${_pkgname} 'synaptics')
groups=('xlibre-drivers')
source=("${url}/${_pkgname}/archive/refs/tags/${_pkgname}-${_pkgver}.tar.gz")
options=('!debug')
install=xf86-input-synaptics.install

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

  cd ${srcdir}/${_pkgname}-${_pkgname}-${_pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${_pkgname}-${_pkgver}
  
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-${_pkgname}-${_pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('b2dfcffb7aafada79bfd28dccfbb1e25ff93a1500ccb4b71e995b8fbcd511fe8')

