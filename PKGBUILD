# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on core/xf86-video-ati: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
#
# Send PRs here: https://github.com/yurikoles-aur/xf86-video-ati-git
#

_pkgname=xf86-video-ati
pkgname="${_pkgname}-git"
pkgver=19.1.0.r15.g7a6a34af
pkgrel=2
epoch=1
pkgdesc="X.org ati video driver"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('systemd-libs' 'mesa')
makedepends=('xorg-server-devel' 'systemd' 'git' 'pixman')
provides=("${_pkgname}")
conflicts=('xorg-server<1.20.0' "${_pkgname}")
groups=('xorg-drivers-git')
source=("${pkgname}::git+https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}*
  # from ati-git AUR pkg
  git describe --long | sed 's/^xf86-video-ati-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd ${pkgname}*

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname}* #-${pkgver}

#  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}*
  make check
}

package() {
  cd ${pkgname}*

  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
