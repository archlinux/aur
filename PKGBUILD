# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on extra/xf86-video-nouveau by
# Andreas Radke <andyrtr@archlinux.org>
# buddabrod <buddabrod@gmail.com>
#
# Pull requests are welcome here:
# https://github.com/yurikoles-aur/xf86-video-nouveau-git
#

pkgname=xf86-video-nouveau-git
_pkgname=xf86-video-nouveau
pkgver=1.0.18.r1.g4ee596f
pkgrel=1
pkgdesc='Open Source 3D acceleration driver for nVidia cards (git version)'
arch=('x86_64')
url="https://nouveau.freedesktop.org/"
license=('MIT')
depends=('systemd-libs' 'mesa' 'libdrm' 'glibc')
makedepends=('git' 'xorg-server-devel' 'systemd')
provides=("xf86-video-nouveau=${pkgver}")
conflicts=('xf86-video-nouveau')
groups=('xorg-drivers-git')
source=("${pkgname}::git+https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^xf86-video-nouveau-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${pkgname}"

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
