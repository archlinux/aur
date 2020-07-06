# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on core/xf86-video-ati: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgname=xf86-video-ati
pkgname="${_pkgname}-git"
pkgver=19.1.0.r4.g38453924
pkgrel=1
epoch=1
pkgdesc="X.org ati video driver"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('systemd-libs' 'mesa')
makedepends=('xorg-server-devel' 'systemd')
provides=("${_pkgname}")
conflicts=('xorg-server<1.20.0' "${_pkgname}")
groups=('xorg-drivers')
source=("${_pkgname}::git+https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^xf86-video-ati-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

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

check() {
  cd "${_pkgname}"
  make check
}

package() {
  cd "${_pkgname}"

  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
