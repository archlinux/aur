# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Andreas Rammhold <andreas@rammhold.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: buddabrod <buddabrod@gmail.com>

pkgname=xf86-video-nouveau-git
_pkgname=xf86-video-nouveau
pkgver=1.0.16+0+gec2b45d
pkgrel=1
pkgdesc="Open Source 3D acceleration driver for nVidia cards"
arch=('i686' 'x86_64')
url="http://nouveau.freedesktop.org/"
license=('GPL')
depends=('systemd-libs' 'mesa')
makedepends=('xorg-server-devel' 'git' 'systemd')
conflicts=('xf86-video-nouveau')
groups=('xorg-drivers')
source=('git://anongit.freedesktop.org/nouveau/xf86-video-nouveau')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/xf86-video-nouveau-//' | sed 's/-/+/g'
}

prepare() {
  cd "${_pkgname}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${_pkgname}"

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS="${CFLAGS/-fno-plt}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt}"
  export LDFLAGS="${LDFLAGS/,-z,now}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
