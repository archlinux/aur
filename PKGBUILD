# based on: https://gitlab.manjaro.org/manjaro-arm/packages/community/xf86-video-fbturbo-git/-/tree/master
# added: fix.patch (from: https://archlinuxarm.org/forum/viewtopic.php?f=15&t=15704#p68372)
# Maintainer: rernrern@gmail.com

pkgname=xf86-video-fbturbo
pkgver=0.4.0
pkgrel=1
pkgdesc='X.org MALI video driver'
arch=('armv7h' 'aarch64')
url="https://github.com/ssvb/xf86-video-fbturbo"
license=('MIT')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION>=24.0' 'git')
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24')
options=('!libtool')
provides=('xf86-video-fbturbo')
source=('git+https://github.com/ssvb/xf86-video-fbturbo'
        '0001-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch'
        '0002-GCC-8-fix.patch'
        '0003-backStorage-fix.patch')
sha256sums=('SKIP'
            '0af499820e3ade74ea6518caa96ec19f39150b1678ad6b33b2a3774b5a9f2c64'
            'ccbd8f0d3fd9da180b2f5ab3be7284ec76e9dbf06762ec765e09a45c530d93bb'
            'a8ca499527fc0da6177a7cca86badd021259e17b2d416bc7f7a6663821e90c12')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i ../0001-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch
  patch -p1 -i ../0002-GCC-8-fix.patch
  patch -p1 -i ../0003-backStorage-fix.patch
}

build() {
  cd "$srcdir/$pkgname"

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  depends=(xf86-input-evdev
           xf86-video-fbdev 
           xf86-video-vesa
           xinput_calibrator
           xorg-server
           xorg-xinit)
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/etc/X11/xorg.conf.d/"
  cp "xorg.conf" "$pkgdir/etc/X11/xorg.conf.d/99-fbturbo.conf"
  make DESTDIR="$pkgdir/" install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
