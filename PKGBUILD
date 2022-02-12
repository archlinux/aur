# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on extra/xf86-video-amdgpu by:
# Laurent Carlier <lordheavym@gmail.com>

pkgname=xf86-video-amdgpu-git
_pkgname=xf86-video-amdgpu
pkgver=21.0.0.r1.g6936552
pkgrel=1
pkgdesc="X.org amdgpu video driver (git version)"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('systemd-libs' 'mesa')
makedepends=('xorg-server-devel' 'systemd' 'git' 'pixman')
conflicts=('xf86-video-amdgpu' 'xorg-server<1.20.0')
provides=('xf86-video-amdgpu')
groups=('xorg-drivers')
source=("${pkgname}::git+https://gitlab.freedesktop.org/xorg/driver/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^xf86.video.amdgpu.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  #CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  ./autogen.sh --prefix=/usr \
    --enable-glamor
  make
}

check() {
  cd ${pkgname}
  make check
}

package() {
  cd ${pkgname}

  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
