# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=lib32-avahi
pkgver=0.6.32rc
pkgrel=1
_commit=bc4e85846991d0efca89add631c7cd16033f0bef
pkgdesc='Multicast DNS-SD / Zeroconf Suite (32-bit)'
arch=('x86_64')
url='http://git.0pointer.net/avahi.git'
license=('LGPL')
depends=('expat' 'lib32-libdaemon' 'lib32-glib2' 'lib32-libdbus' 'lib32-libcap' 'lib32-gdbm' 'avahi')
makedepends=(git lib32-qt4 pygtk mono intltool python2-dbus gtk-sharp-2 gobject-introspection lib32-gtk3
             xmltoman python-dbus)
optdepends=('lib32-gtk3: avahi-discover-standalone, bshell, bssh, bvnc'
            'lib32-gtk2: gtk2 bindings'
            'lib32-qt4: qt4 bindings')
options=(!emptydirs)
source=("git+https://github.com/heftig/avahi#commit=$_commit")
sha256sums=('SKIP')


prepare() {
  cd ${pkgname#lib32-}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname#lib32-}
  export MOC_QT4=/usr/bin/moc-qt4 PYTHON=/usr/bin/python2

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libdir=/usr/lib32 \
    --disable-monodoc \
    --disable-qt3 \
    --enable-compat-libdns_sd \
    --enable-compat-howl \
    --with-distro=archlinux \
    --with-avahi-priv-access-group=network \
    --with-autoipd-user=avahi \
    --with-autoipd-group=avahi \
    --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd ${pkgname#lib32-}
  make DESTDIR="${pkgdir}" install

  # howl compat
  ln -s avahi-compat-howl.pc "$pkgdir/usr/lib32/pkgconfig/howl.pc"

  # Remove conflicting files.
  rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin,lib32/mono}}
}