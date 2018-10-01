# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-intel-git
_pkgname=xf86-video-intel
pkgver=2.99.917+847+g25c9a2fc
pkgrel=4
epoch=1
arch=(x86_64)
url="https://01.org/linuxgraphics"
license=('custom')
install="${_pkgname}.install"
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers"
depends=('mesa' 'libxvmc' 'pixman' 'xcb-util>=0.3.9' 'libsystemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0' 'libx11' 'libxrender'
             # additional deps for intel-virtual-output
             'libxrandr' 'libxinerama' 'libxcursor' 'libxtst' 'libxss'
             # additional for git snapshot
             'git') # 'meson' 'valgrind')
optdepends=('libxrandr: for intel-virtual-output'
            'libxinerama: for intel-virtual-output'
            'libxcursor: for intel-virtual-output'
            'libxtst: for intel-virtual-output'
            'libxss: for intel-virtual-output')
replaces=("${_pkgname}" 'xf86-video-intel-uxa' 'xf86-video-intel-sna')
provides=("${_pkgname}" 'xf86-video-intel-uxa' 'xf86-video-intel-sna')
conflicts=("${_pkgname}" 'xorg-server<1.20' 'xf86-video-intel-sna'
           'xf86-video-intel-uxa' 'xf86-video-i810' 'xf86-video-intel-legacy')
groups=('xorg-drivers')
source=("$pkgname::git+https://gitlab.freedesktop.org/xorg/driver/${_pkgname}.git"
        0001-SNA-fix-PRIME-output-support-since-xserver-1.20.patch)

sha256sums=('SKIP'
            '7cdc310953379ede9693a387ecac6c803cc4c4461df5ad9ab875b35e90a552f5')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # fix external monitor - FS#58895
  # https://bugs.freedesktop.org/show_bug.cgi?id=100086
  patch -Np1 -i ../0001-SNA-fix-PRIME-output-support-since-xserver-1.20.patch

  NOCONFIGURE=1 ./autogen.sh

#  mkdir build
}

build() {
  cd $pkgname

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-default-dri=3
  make
#  cd build
#  arch-meson $pkgname build \
#   -Dwith-default-dri=3
#  ninja -C build
}

check() {
  cd $pkgname
  make check
#  meson test -C build
}

package() {
  cd $pkgname

  make DESTDIR="${pkgdir}" install

#  DESTDIR="$pkgdir" ninja -C build install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
