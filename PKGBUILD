# Maintainer: Kyuunex <kyuunex at protonmail dot ch>

pkgname=xorg-xwayland-osu
pkgver=22.1.8
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
pkgdesc="run X clients under wayland (patched specifically to run osu! under Wine correctly)"
depends=('nettle' 'libepoxy' 'systemd-libs' 'libxfont2' 
         'pixman' 'xorg-server-common' 'libxcvt' 'mesa')
makedepends=('meson' 'xorgproto' 'xtrans' 'libxkbfile' 'dbus'
             'xorg-font-util'
             'wayland' 'wayland-protocols'
             'libdrm' 'mesa-libgl'
             'systemd'
             'egl-wayland'
)
source=(https://xorg.freedesktop.org/archive/individual/xserver/xwayland-$pkgver.tar.xz{,.sig}
        xwayland-vsync.diff)
sha512sums=('f52c6f99d8ef7605bc1c651d5ee5e306c12af30649a2d712b1c4c3cf4c7c80246ae24bd9ac39461d47aafc78f5d659446a459cd6259e05ef3128b204981d114a'
            'SKIP'
            'ce461fde80aeddf1ed0b412e1b79486759e3981448ccbc1af45591aa1b80a094386f0ecb1aa5bfb68ab6f2169c0a1ab9e6517cb6bc04317290077ded2f8b78b6')
provides=('xorg-server-xwayland'
          'xorg-xwayland')
conflicts=('xorg-server-xwayland'
           'xorg-xwayland')
replaces=('xorg-server-xwayland'
          'xorg-xwayland')
#validpgpkeys=('B09FAF35BE914521980951145A81AF8E6ADBB200') # "Michel Daenzer <michel@daenzer.net>"
validpgpkeys=('67DC86F2623FC5FD4BB5225D14706DBE1E4B4540') # "Olivier Fourdan <fourdan@xfce.org>"
#validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
    cd "$srcdir"/xwayland-$pkgver
    patch -Np1 -i "$srcdir"/xwayland-vsync.diff
}

build() {
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
  meson configure build
  ninja -C build
}

package() {

  # bin + manpage + .pc file
  install -m755 -Dt "${pkgdir}"/usr/bin build/hw/xwayland/Xwayland
  install -m644 -Dt "${pkgdir}"/usr/share/man/man1 build/hw/xwayland/Xwayland.1
  install -m644 -Dt "${pkgdir}"/usr/lib/pkgconfig build/hw/xwayland/xwayland.pc

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xwayland-$pkgver/COPYING
}
