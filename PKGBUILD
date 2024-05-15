# Maintainer: taoky <me@taoky.moe>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# (This PKGBUILD is modified from xorg-xwayland)

pkgname=xwayland-standalone-with-libdecor
pkgver=24.1
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
pkgdesc="A standalone Xwayland binary with libdecor support"
depends=('nettle' 'libepoxy' 'libxfont2' 'pixman'
         'xorg-server-common' 'libxcvt' 'mesa'
         'libglvnd' 'libxau' 'wayland' 'libdrm' 'libtirpc'
         'libxshmfence' 'glibc' 'libdecor')
makedepends=('meson' 'xorgproto' 'xtrans' 'libxkbfile' 'dbus'
             'xorg-font-util' 'wayland-protocols' 'mesa-libgl'
             'systemd')
source=("git+https://gitlab.freedesktop.org/xorg/xserver.git#branch=xwayland-24.1")
sha512sums=('SKIP')
#provides=('xorg-server-xwayland')
#conflicts=('xorg-server-xwayland')
#replaces=('xorg-server-xwayland')
#validpgpkeys=('B09FAF35BE914521980951145A81AF8E6ADBB200') # "Michel Daenzer <michel@daenzer.net>"
#validpgpkeys=('67DC86F2623FC5FD4BB5225D14706DBE1E4B4540') # "Olivier Fourdan <fourdan@xfce.org>"
#validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>


build() {
  echo $(pwd)
  arch-meson xserver build \
    -D ipv6=true \
    -D xvfb=false \
    -D xdmcp=false \
    -D xcsecurity=true \
    -D dri3=true \
    -D glamor=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb \
    -D libdecor=true

  # Print config
  meson configure build
  ninja -C build
}

package() {
  # Here we only need to Xwayland binary
  # DESTDIR="${pkgdir}" ninja -C build install
  # xorg-server-common file /usr/lib/xorg/protocol.txt
  # rm "${pkgdir}"/usr/lib/xorg/protocol.txt
  # rmdir "${pkgdir}"/usr/lib/xorg
  # rm "${pkgdir}"/usr/share/man/man1/Xserver.1

  install -m755 -D build/hw/xwayland/Xwayland "${pkgdir}/usr/bin/Xwayland-standalone"
  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xserver/COPYING
}

