# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Andreas Rammhold <andreas@rammhold.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: buddabrod <buddabrod@gmail.com>

pkgname=xf86-video-nouveau-git
_pkgname=xf86-video-nouveau
pkgver=1.0.17.r2.g3ee7cbc
pkgrel=2
pkgdesc='Open Source 3D acceleration driver for nVidia cards (git version)'
arch=('x86_64')
url="https://nouveau.freedesktop.org/"
license=('GPL')
groups=('xorg-drivers-git')
depends=('systemd-libs' 'mesa')
makedepends=('git' 'xorg-server-devel' 'xorg-server' 'systemd')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git://anongit.freedesktop.org/nouveau/xf86-video-nouveau")
sha256sums=('SKIP')

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
  export CFLAGS="${CFLAGS/-fno-plt}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt}"
  export LDFLAGS="${LDFLAGS/,-z,now}"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
