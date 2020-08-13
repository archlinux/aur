# Maintainer: Daniel Bertalan <dani@danielbertalan.dev>
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
_bzrrev=296
pkgver=${_bzrtag}.r${_bzrrev}
pkgrel=1
pkgdesc='Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray'
url='https://launchpad.net/libappindicator'
arch=('x86_64')
depends=('libappindicator-gtk2' 'gtk-sharp-2')
license=('LGPL2.1' 'LGPL3')
makedepends=('bzr' 'dbus-glib' 'gnome-common' 'gobject-introspection' 'gtk-doc' 'libdbusmenu-gtk2' 'libindicator-gtk2' 'perl-xml-libxml' 'pygtk' 'vala')
options=('!emptydirs')
source=(bzr+lp:libappindicator#revision=$_bzrrev
        no-host.patch)
sha512sums=('SKIP'
            'cfc9481ad26712063f9d1bfdd1f94327f579c0c58385cec8adb4e5f12398ef2eb4427a62e6580cda75434d967623235940562f826a909501ee52eef8135703fa')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  (cd ${_pkgbase}

    # Fall back to tray icon when StatusNotifierHost is not available.
    # https://code.launchpad.net/~muktupavels/libappindicator/no-host/+merge/386817
    patch -p0 < "${srcdir}/no-host.patch"

    sed -i 's/-Werror//' src/Makefile.am
    ./autogen.sh
  )
  cp -ra ${_pkgbase}{,-gtk2}
}

build() {
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
  export CSC='/usr/bin/mcs'

  msg2 'Building gtk3...'
  (cd ${_pkgbase}
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --with-gtk=3 \
      --disable-{gtk-doc-html,mono-test,static,tests}
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make -j1
  )

  msg2 'Building gtk2...'
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
