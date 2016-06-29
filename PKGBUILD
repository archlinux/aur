# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens at gmail dot com>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Douglas Soares de Andrade <douglas at archlinux dot org>

pkgname=lib32-avahi
pkgver=0.6.32
pkgrel=1
_commit=4f334990f692ce08ab4ea2eece695f1592f535b2
pkgdesc='Service Discovery for Linux using mDNS/DNS-SD -- compatible with Bonjour (32-bit)'
arch=('x86_64')
url='https://github.com/lathiat/avahi'
license=('LGPL')
depends=("${pkgname#lib32-}" 'expat' 'lib32-gdbm' 'lib32-glib2' 'lib32-libcap' 'lib32-libdaemon' 'lib32-libdbus')
makedepends=('gcc-multilib' 'git' 'gobject-introspection' 'gtk-sharp-2' 'intltool' 'lib32-gtk2' 'lib32-gtk3' 'lib32-qt4'
             'pygtk' 'python-dbus' 'python2-dbus' 'mono' 'xmltoman')
optdepends=('lib32-gtk3: gtk3 bindings'
            'lib32-gtk2: gtk2 bindings'
            'lib32-qt4: qt4 bindings')
options=(!emptydirs)
source=("git+$url#tag=$_commit")
sha256sums=('SKIP')

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS+=' -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  export MOC_QT4=/usr/bin/moc-qt4 PYTHON=/usr/bin/python2

  cd ${pkgname#lib32-}
  NOCONFIGURE=1 ./autogen.sh

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