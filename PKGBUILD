# Maintainer: warpigglets
# Contributor: Daniel Bertalan <dani@danielbertalan.dev>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: FadeMind <fademind at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: bitwave <aur at oomlu dot de>
# Contributor: willemw <willemw12 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=libappindicator
pkgname=${_pkgbase}-sharp
_bzrtag=12.10.0
_bzrrev=298
pkgver=${_bzrtag}.r${_bzrrev}
pkgrel=1
pkgdesc='Allow applications to extend a menu in Unity, KDE or Systray (Mono GTK+ 2 bindings)'
url='https://launchpad.net/libappindicator'
arch=('any')
depends=('mono' "libappindicator-gtk2=${pkgver}" 'gtk-sharp-2' 'glib2')
license=('LGPL2.1' 'LGPL3')
makedepends=('bzr' 'libdbusmenu-gtk2' 'libindicator-gtk2' 'gnome-common' 'dbus-glib' 'perl-xml-libxml' 'gtk-doc' 'python-dulwich')
options=('!strip')
source=(bzr+lp:libappindicator#revision=$_bzrrev)
sha512sums=('SKIP')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  (cd ${_pkgbase}

    sed -i 's/-Werror//' src/Makefile.am
    ./autogen.sh
  )
  cp -ra ${_pkgbase}{,-gtk2}
}

build() {
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
  export CSC='/usr/bin/mcs'

  (cd ${_pkgbase}-gtk2
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --with-gtk=2 \
      --disable-{gtk-doc-html,mono-test,static,tests}
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make -j1
  )

}

package() {
  cd ${_pkgbase}-gtk2
  make -j1 -C bindings/mono DESTDIR="${pkgdir}" install
}
# vim: ts=2 sw=2 et:
