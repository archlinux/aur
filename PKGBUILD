# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=xorg-xwayland-git
pkgver=24.0.99.901.r102.g08113b892
pkgrel=2
arch=('x86_64')
license=(
  LicenseRef-Adobe-Display-PostScript
  BSD-3-Clause
  LicenseRef-DEC-3-Clause
  HPND
  LicenseRef-HPND-sell-MIT-disclaimer-xserver
  HPND-sell-variant
  ICU
  ISC
  MIT
  MIT-open-group
  NTP
  SGI-B-2.0
  SMLNJ
  X11
  X11-distribute-modifications-variant)
groups=('xorg')
url="https://xorg.freedesktop.org"
pkgdesc="Run X clients under Wayland (git version)"
depends=('nettle' 'libepoxy' 'systemd-libs' 'libxfont2'
         'pixman' 'xorg-server-common' 'libxcvt' 'mesa'
         'libglvnd' 'libxau' 'wayland' 'libdrm' 'libtirpc'
         'libei' 'libxshmfence' 'glibc')
makedepends=('meson' 'xorgproto' 'xtrans' 'libxkbfile' 'dbus'
             'xorg-font-util' 'wayland-protocols' 'mesa-libgl'
             'systemd' 'git')
source=("xserver::git+https://gitlab.freedesktop.org/xorg/xserver.git")
sha256sums=('SKIP')

provides=('xorg-xwayland' 'xorg-server-xwayland' 'xorg-server-xwayland-git')
conflicts=('xorg-xwayland' 'xorg-server-xwayland' 'xorg-server-xwayland-git')
replaces=('xorg-server-xwayland-git')

pkgver() {
  cd xserver
  local branch=origin/xwayland-24.1
  local head=$(git rev-parse --short HEAD)
  local tag=$(git describe --abbrev=0 "$branch")
  local revisions=$(git rev-list "${tag}..HEAD" --count)
  printf "%s.r%d.g%s" "$(echo "$tag" | sed 's/^xwayland.//')" "$revisions" "$head"
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  #  export CFLAGS=${CFLAGS/-fno-plt}
  #  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  #  export LDFLAGS=${LDFLAGS/,-z,now}

  arch-meson xserver build \
    -D ipv6=true \
    -D xvfb=false \
    -D xnest=false \
    -D xdmcp=false \
    -D xcsecurity=true \
    -D xorg=false \
    -D xephyr=false \
    -D xwayland=true \
    -D xwin=false \
    -D xquartz=false \
    -D dri3=true \
    -D glamor=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  # xorg-server-common file /usr/lib/xorg/protocol.txt
  rm "${pkgdir}"/usr/lib/xorg/protocol.txt
  rmdir "${pkgdir}"/usr/lib/xorg
  rm "${pkgdir}"/usr/share/man/man1/Xserver.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}
