# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xlibre-video-intel
_pkgname=xf86-video-intel
pkgver=25.0.0
pkgrel=9
arch=(x86_64)
url='https://github.com/X11Libre/xf86-video-intel'
license=('MIT')
install=$pkgname.install
pkgdesc="XLibre Intel i810/i830/i915/945G/G965+ video drivers"
depends=('mesa' 'libxvmc' 'pixman' 'xcb-util>=0.3.9' 'systemd-libs'
         'libxcb' 'libxfixes' 'libxshmfence' 'libdrm' 'libxrender'
         'libx11' 'libxdamage' 'libxext' 'libpciaccess' 'glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-VIDEODRV_VERSION=28.0' 'libxv'
             # additional deps for intel-virtual-output
             'libxrandr' 'libxinerama' 'libxcursor' 'libxtst' 'libxss')
             # 'meson' 'valgrind')
optdepends=('libxrandr: for intel-virtual-output'
            'libxinerama: for intel-virtual-output'
            'libxcursor: for intel-virtual-output'
            'libxtst: for intel-virtual-output'
            'libxss: for intel-virtual-output')
replaces=('xf86-video-intel-uxa' 'xf86-video-intel-sna')
provides=('xf86-video-intel' 'xf86-video-intel-uxa' 'xf86-video-intel-sna')
conflicts=('xf86-video-intel' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29'
           'xf86-video-intel-sna' 'xf86-video-intel-uxa' 'xf86-video-i810' 'xf86-video-intel-legacy')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c37410bc6efd5789adcd9fd2c91308a73101b08419309d4755bd6b5fa5254eff')
options=('!lto')

prepare() {
  cd $_pkgname-xlibre-$_pkgname-$pkgver
  NOCONFIGURE=1 ./autogen.sh

#  mkdir build
}

build() {
  cd $_pkgname-xlibre-$_pkgname-$pkgver

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  ./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-default-dri=3
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
#  cd build
#  arch-meson $pkgname build \
#   -Dwith-default-dri=3
#  ninja -C build
}

check() {
  cd $_pkgname-xlibre-$_pkgname-$pkgver
  make check
#  meson test -C build
}

package() {
  cd $_pkgname-xlibre-$_pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

#  DESTDIR="$pkgdir" ninja -C build install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
