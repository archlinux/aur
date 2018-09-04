# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
# Credit: Laurent Carlier <lordheavym@gmail.com>

pkgname=xf86-video-amdgpu-git
_pkgbase=xf86-video-amdgpu
pkgver=18.0.1.59
pkgrel=1
pkgdesc="X.org amdgpu video driver (git version)"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libsystemd' 'mesa')
makedepends=('xorg-server-devel' 'systemd')
conflicts=('xf86-video-amdgpu' 'xorg-server<1.20.0')
provides=('xf86-video-amdgpu')
groups=('xorg-drivers')
source=('xf86-video-amdgpu::git://anongit.freedesktop.org/xorg/driver/xf86-video-amdgpu#branch=master')
sha256sums=('SKIP')

# pkgver() {
#   cd "${_pkgbase}"
#   ( set -o pipefail
#   git describe --long | sed 's/^xf86-video-amdgpu-//;s/\([^-]*-g\)/r\1/;s/-/./g'
#   )
# }

pkgver() {
  local version count

  cd "$_pkgbase"

  version="$(git describe --abbrev=0 --tags)"
  count="$(git rev-list --count ${version}..)"
  printf '%s.%s' "${version#v}" "${count}"|sed 's/^xf86-video-amdgpu-//'
}

build() {
  cd "${_pkgbase}"

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./autogen.sh --prefix=/usr \
    --enable-glamor
  make
}

check() {
  cd "${_pkgbase}"
  make check
}

package() {
  cd "${_pkgbase}"

  make "DESTDIR=${pkgdir}" install
  install -m0755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
