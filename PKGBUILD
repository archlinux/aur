# Maintainer: Kyuunex <kyuunex at protonmail dot ch>

pkgname=xorg-xwayland-osu
pkgver=23.1.0
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
sha512sums=('984213a193b903e6023ecb3144a15f483dc3e9ec7cb02c36d8e67c6859b501b8b3e5a6e1ade9cb245450ad93002322f392b81d9286377ac34350cc3ea1f9679f'
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

  DESTDIR="${pkgdir}" ninja -C build install
  # xorg-server-common file /usr/lib/xorg/protocol.txt
  rm "${pkgdir}"/usr/lib/xorg/protocol.txt
  rmdir "${pkgdir}"/usr/lib/xorg
  rm "${pkgdir}"/usr/share/man/man1/Xserver.1

  # license
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" xwayland-$pkgver/COPYING
}
