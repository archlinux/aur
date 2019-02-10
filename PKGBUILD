# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-mga
pkgver=2.0.0
pkgrel=1
pkgdesc="X.org mga video driver"
arch=('x86_64')
url="https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga"
license=('custom')
groups=('xorg-drivers' 'xorg')
depends=('glibc')
makedepends=('xorg-server-devel'
             'git')
optdepends=('mga-dri: DRI1 support from community repo')
conflicts=('xorg-server<1.19'
           'X-ABI-VIDEODRV_VERSION<23'
           'X-ABI-VIDEODRV_VERSION>=24')
source=("git+https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe | sed 's/^.*mga-//g' | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}"
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
