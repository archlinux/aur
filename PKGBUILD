# Maintainer: nloewen <loewen.nathan@gmail.com>

# Initially copied from the xorg-server-git package maintained by JustKidding <jk@vin.ovh>

pkgname='xorg-server-xwayland-standalone-git'
_pkgbase='xserver'
pkgver=1.20.0.r789.g446ff2d31
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://gitlab.freedesktop.org/xorg/xserver.git"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'xtrans'
             'libxkbfile' 'libxfont2' 'libpciaccess' 'libxv'
             'libxmu' 'libxrender' 'libxi' 'libxaw' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms'
             'libxshmfence' 'libunwind' 'systemd' 'wayland-protocols' 'egl-wayland' 'meson' 'git')
_srcurl="git+https://gitlab.freedesktop.org/xorg/xserver.git"
source=($_srcurl)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  # cutting off 'xorg.server.' prefix that presents in the git tag
  git describe --long --tags| sed 's/^xorg.server.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgbase}"
  cd ..
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  export CFLAGS="$CFLAGS -fplt -fno-lto"
  export CXXFLAGS="$CXXFLAGS -fplt -fno-lto"
  export LDFLAGS="$LDFLAGS,-fno-lto"

  arch-meson ${_pkgbase} build \
    $mesonFlags \
    -D os_vendor="Arch Linux" \
    -D ipv6=true \
    -D xvfb=false \
    -D xnest=false \
    -D xcsecurity=true \
    -D xorg=false \
    -D xephyr=false \
    -D xwayland=true \
    -D xwayland_eglstream=true \
    -D xwin=false \
    -D xquartz=false \
    -D glamor=true \
    -D udev=true \
    -D systemd_logind=true \
    -D suid_wrapper=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D b_lto=false \
    -D b_lundef=false

  # Print config
  meson configure build
}

build() {
  msg2 "Please confirm"
  for VAR in VIDEODRV XINPUT EXTENSION; do
    echo "X-ABI-${VAR}_VERSION=$(grep -Po "${VAR}_V.*\(\K[^)]*" xserver/hw/xfree86/common/xf86Module.h |& sed 's/, /./')"
  done

  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  
  ninja -C build

  # fake installation to be seperated into packages
  DESTDIR="${srcdir}/fakeinstall" ninja -C build install
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    mv -v "${src}" "${dir}/"
  done
}

package() {
  _pkgname='xorg-server-xwayland'
  provides=('xorg-server-xwayland')
  conflicts=('xorg-server-xwayland')
  pkgdesc="run X clients under wayland (git version)"
  depends=(libxfont2 libepoxy libunwind systemd-libs libgl pixman xorg-server-common
           nettle libtirpc)

  _install fakeinstall/usr/bin/Xwayland
  _install fakeinstall/usr/share/man/man1/Xwayland.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgbase}"/COPYING
}

