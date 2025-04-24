# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.22.0+r160+gc86e114
pkgrel=4
epoch=1
pkgdesc="A VNC Client for the GNOME desktop"
url="https://wiki.gnome.org/Apps/Vinagre"
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(
  avahi
  cairo
  dbus-glib
  dconf
  freerdp2
  gdk-pixbuf2
  glib2
  glibc
  gtk-vnc
  gtk3
  hicolor-icon-theme
  libsecret
  libxml2
  spice-gtk
  telepathy-glib
  vte3
)
makedepends=(
  appstream-glib
  docbook-xsl
  git
  gnome-common
  gobject-introspection
  intltool
  itstool
  openssh
  spice-protocol
  vala
)
optdepends=('openssh: SSH plugin')
_commit=c86e114efe31381bff3cad008e9f2cd84a83a803  # master
source=("git+https://gitlab.gnome.org/GNOME/vinagre.git#commit=$_commit"
        vinagre-gcc10.patch
        vinagre-c99.patch
        vinagre-incompatible-pointer.patch
        vinagre-infinite-loop.patch
        vinagre-revert-icon.patch
        vinagre-appdata-fixes.patch)
b2sums=('eb334fd752b160ada248ba166615709749ec45b5e7619e9dd35999b961a89b7278c45fddd49a7180570fccf7f8bbc226738372984d9fe22b467e1ced139cfed3'
        'c1727c209dbc556c665272097976342608a419a68f4f5e1462c4734349a4a3c2a601fba35aa294b9ff70532c617b5c3934966e4338606e2f26513672bcefab1b'
        '57a7e7a4dacfcc6ccc53aeeee6423422ec031cdd6af8ed1f52b465dfb2f39a60d8c494ef036a182a328dc5b3b99b1f3cf5f85ebdf325b7f312f6f751690a0a7a'
        '558517e99cf9301b2600a181bb1b2b0901e6bacf13d3d91a97681d5fe6ee5074c8187495f78aec3644551dfd5687c399c67c094f96a020843b6b87231d102914'
        '93bdecb1fb6d9a6dac163ae0360c48d8393d919d6412a96723b8fb1d7e1aab7c9e3678bdf9982ba38e91b8f7d1057802d5a69fc6e2b35d961da8677dc3a56d44'
        '9683dc8249af4a8a2e5ce7b81dcad5bf458e0595c4e9f72605f140a852b582591372c5bc71692913d79fc4ad375d86d518b406171063ce01dc107c649b7574ea'
        '89f9ddb3d0e0dd5c1b40384b96da16fda7d5db595151a6dc48dd12db2862c105b3a571b2aba5a3957c4ad2eb7db93dfbbacf919501591834285d2796a446c73c')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  # Fix build with -fno-common
  git apply -3 ../vinagre-gcc10.patch

  # Fix implicit-int build error
  git apply -3 ../vinagre-c99.patch

  # Fix incompatible-pointer-types build error
  git apply -3 ../vinagre-incompatible-pointer.patch

  # Various fixes for the RDP plugin
  git cherry-pick -n 404a56a11469ef24a1df632847465030d81db091
  git cherry-pick -n 18150f00a889e7f02d15f04e868e7b019ccdf0f2
  git apply -3 ../vinagre-infinite-loop.patch

  # Add back application icon
  git checkout 9f4ffdfab3d126a4c9e19d2e9d766aaeeb45dbb5~1 -- data/icons
  git apply -3 ../vinagre-revert-icon.patch

  # Update URLs in metainfo
  git apply -3 ../vinagre-appdata-fixes.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$pkgname \
    --enable-rdp --enable-spice --enable-compile-warnings=minimum
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
