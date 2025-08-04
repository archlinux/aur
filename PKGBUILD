# Maintainer: artist for the official Xlibre project

pkgname=xlibre-xf86-input-wacom
_pkgname=xf86-input-wacom
pkgver=1.2.3.1
pkgrel=5
pkgdesc="Official XLibre fork of X.Org Wacom tablet driver"
arch=(x86_64 aarch64)
url="https://github.com/X11Libre"
license=('GPL-2.0-or-later')
depends=('libxi' 'libxinerama' 'libxrandr' 'libx11' 'glibc')
makedepends=('xlibre-xserver' 'xlibre-xserver-common' 'xlibre-xserver-devel' 'X-ABI-XINPUT_VERSION=26.0'
  'xorgproto')
  # for tests:
  #'python-libevdev' 'python-pytest' 'python-yaml' 'python-gobject' 'python-attrs'
conflicts=("$_pkgname" 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
provides=("$_pkgname")
source=("${url}/${_pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz"
        aggregate.patch)
groups=('xlibre-drivers')
options=('!debug')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/aggregate.patch
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

  meson ${_pkgname}-${pkgname}-${pkgver} build \
    --prefix=/usr \
    --libexecdir=lib \
    -D xorg-conf-dir=/usr/share/X11/xorg.conf.d/ \
    -D unittests=disabled

  meson configure build
  ninja -C build
}

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/lib/systemd"
}

sha256sums=('961f7b229e79e585a85b59be395e54392c00a3766204de95af832d2fa59207ed'
            '1fca9985ac7cee6ea27956839c38f1c2b6b2cefc6bf51747378d1f93f9504b1c')

