# Maintainer: Amadeus Folego <amadeusfolego@gmail.com>

pkgname=('xorg-server-xwayland-dbg')
pkgver=21.1.4
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
pkgdesc="run X clients under wayland (debug)"
depends=('nettle' 'libepoxy' 'systemd-libs' 'libxfont2' 
         'pixman' 'xorg-server-common' 'libxcvt')
makedepends=('meson' 'xorgproto' 'xtrans' 'libxkbfile' 'dbus'
             'xorg-font-util'
             'wayland' 'wayland-protocols'
             'libdrm' 'mesa-libgl'
             'systemd'
             'egl-wayland'
)
source=(https://xorg.freedesktop.org/archive/individual/xserver/xwayland-$pkgver.tar.xz)
sha512sums=('SKIP')
provides=('xorg-server-xwayland')
conflicts=('xorg-server-xwayland')
replaces=('xorg-server-xwayland')
#validpgpkeys=('B09FAF35BE914521980951145A81AF8E6ADBB200') # "Michel Daenzer <michel@daenzer.net>"
#validpgpkeys=('67DC86F2623FC5FD4BB5225D14706DBE1E4B4540') # "Olivier Fourdan <fourdan@xfce.org>"
options=(debug strip)

build() {
  CFLAGS=${CFLAGS/-fvar-tracking-assignments}
  CXXFLAGS=${CXXFLAGS/-fvar-tracking-assignments}

  arch-meson xwayland-$pkgver build \
    -D ipv6=true \
    -D xvfb=false \
    -D xdmcp=false \
    -D xcsecurity=true \
    -D dri3=true \
    -D xwayland_eglstream=true \
    -D glamor=true \
    -D xkb_dir=/usr/share/X11/xkb \
    -D xkb_output_dir=/var/lib/xkb

  # Print config
  meson configure build -Ddebug=true -Dbuildtype=debug
  ninja -C build
}

package() {
  # debug symbols
  #install -m644 -Dt "${pkgdir}"/usr/lib/debug/usr/bin build/hw/xwayland/Xwayland.debug
  # src
  #find xwayland-"${pkgver}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/src/debug/{}" \;

  # bin + manpage + .pc file
  install -m755 -Dt "${pkgdir}"/usr/bin build/hw/xwayland/Xwayland
  install -m644 -Dt "${pkgdir}"/usr/share/man/man1 build/hw/xwayland/Xwayland.1
  install -m644 -Dt "${pkgdir}"/usr/lib/pkgconfig build/hw/xwayland/xwayland.pc

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xwayland-$pkgver/COPYING
}
