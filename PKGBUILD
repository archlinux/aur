# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on extra/xf86-video-amdgpu by
# Laurent Carlier <lordheavym@gmail.com>
#
# Send PRs here: https://github.com/yurikoles-aur/xf86-video-amdgpu-git
#

pkgname=xf86-video-amdgpu-ps4
pkgver=23.0.0.r26.gb696afa
pkgrel=2
pkgdesc="X.org amdgpu video driver (git version)"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('MIT')
depends=('systemd-libs' 'mesa' 'libdrm' 'glibc')
makedepends=('git' 'meson' 'xorg-server-devel' 'systemd')
provides=("xf86-video-amdgpu=${pkgver}")
conflicts=("xf86-video-amdgpu")
groups=('xorg-drivers-git')
source=("${pkgname}::git+https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu.git"
        'amdgpu-23.0.0.patch')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed "s/^xf86-video-amdgpu.//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/-Wl,-z,now}

  #CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  arch-meson "${pkgname}" build -Dglamor=enabled

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "${pkgdir}" --quiet

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
