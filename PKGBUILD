# Maintainer: martiuk <me at martinke dot mp>

pkgname=xorg-xwayland-explicit-sync-git
pkgver=23.2.4.r387.ga57b44948
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
pkgdesc="Run X clients under Wayland with explicit sync patch"
depends=('nettle' 'libegl' 'libepoxy' 'systemd-libs' 'libxfont2'
         'pixman' 'xorg-server-common' 'libxcvt')
makedepends=('meson' 'git'
             'xorgproto-git'
             'xtrans'
             'libxkbfile' 'dbus'
             'xorg-font-util'
             'wayland'
             'wayland-protocols'
             'libdrm'
             'systemd'
)
source=(
  "xserver::git+https://gitlab.freedesktop.org/xorg/xserver.git"
  "explicit-sync.patch::https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/967.patch"
)
b2sums=('SKIP'
        'SKIP')
provides=('xorg-xwayland' 'xorg-server-xwayland' 'xorg-server-xwayland-git')
conflicts=('xorg-xwayland' 'xorg-server-xwayland' 'xorg-server-xwayland-git')

pkgver() {
  cd xserver
  local branch=origin/xwayland-23.2
  local head=$(git rev-parse --short HEAD)
  local tag=$(git describe --abbrev=0 "$branch")
  local revisions=$(git rev-list "${tag}..HEAD" --count)
  printf "%s.r%d.g%s" "$(echo "$tag" | sed 's/^xwayland.//')" "$revisions" "$head"
}

prepare() {
  cd xserver
  patch -Np1 -i "${srcdir}/explicit-sync.patch"
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
    -D xcsecurity=true \
    -D xorg=false \
    -D xephyr=false \
    -D xwayland=true \
    -D xwin=false \
    -D xquartz=false \
    -D glamor=true \
    -D udev=true \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb

  ninja -C build
}

package() {

  # bin + manpage + .pc file
  install -m755 -Dt "${pkgdir}"/usr/bin build/hw/xwayland/Xwayland
  install -m644 -Dt "${pkgdir}"/usr/share/man/man1 build/hw/xwayland/Xwayland.1
  install -m644 -Dt "${pkgdir}"/usr/lib/pkgconfig build/meson-private/xwayland.pc

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}
