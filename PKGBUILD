# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=xorg-xwayland-hidpi-xprop
pkgver=22.1.7
pkgrel=2
arch=('x86_64')
license=('custom')
url="https://xorg.freedesktop.org"
pkgdesc="run X clients under wayland, with !733 HiDPI patch"
depends=('nettle' 'libepoxy' 'systemd-libs' 'libxfont2' 
         'pixman' 'xorg-server-common' 'libxcvt' 'mesa')
makedepends=('meson' 'xorgproto' 'xtrans' 'libxkbfile' 'dbus'
             'xorg-font-util'
             'wayland' 'wayland-protocols'
             'libdrm' 'mesa-libgl'
             'systemd'
             'egl-wayland'
)
source=(https://xorg.freedesktop.org/archive/individual/xserver/xwayland-$pkgver.tar.xz{,.sig} hidpi.patch)
sha512sums=('dc4187d4e9e1bbf5f431a4a71da01b773be3a8870c3f82da599739d9f72756ac69c1fb8cc3b6c96c88da3c1dd40ce42429a3a003c08f90fc337ebaf6200de649'
            'SKIP'
            '7132c44d9bbf1c5f93906ef301a6e946f0909da0b9273f397281e681ad0da77d62b960a9dd0a640c7209548192fefba9bde03c493f3a89d08cd73a12844bb518')
provides=('xorg-server-xwayland' 'xorg-xwayland')
conflicts=('xorg-server-xwayland' 'xorg-xwayland')
replaces=('xorg-server-xwayland')
#validpgpkeys=('B09FAF35BE914521980951145A81AF8E6ADBB200') # "Michel Daenzer <michel@daenzer.net>"
validpgpkeys=('67DC86F2623FC5FD4BB5225D14706DBE1E4B4540') # "Olivier Fourdan <fourdan@xfce.org>"
#validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>
options=('debug')

prepare() {
  cd ${srcdir}/xwayland-$pkgver
  patch -Np1 -i ../hidpi.patch
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
