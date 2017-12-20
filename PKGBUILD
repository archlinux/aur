# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-mga
pkgver=xf86+video+mga+1.6.5+8+g2998868
pkgrel=1
pkgdesc="X.org mga video driver"
arch=(x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'git')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
optdepends=('mga-dri: DRI1 support from community repo')
groups=('xorg-drivers' 'xorg')
source=("git+https://anongit.freedesktop.org/git/xorg/driver/xf86-video-mga")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
