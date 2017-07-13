# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens at gmail dot com>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Douglas Soares de Andrade <douglas at archlinux dot org>

pkgname=lib32-avahi
pkgver=0.7
pkgrel=1
pkgdesc='Service Discovery for Linux using mDNS/DNS-SD -- compatible with Bonjour (32-bit)'
arch=('x86_64')
url='https://github.com/lathiat/avahi'
license=('LGPL')
depends=("${pkgname#lib32-}" 'expat' 'lib32-gdbm' 'lib32-glib2' 'lib32-libcap' 'lib32-libdaemon' 'lib32-dbus')
makedepends=('gcc-multilib' 'git' 'gobject-introspection' 'gtk-sharp-2' 'intltool' 'lib32-gtk2' 'lib32-gtk3' 'lib32-qt4'
             'pygtk' 'python-dbus' 'python2-dbus' 'python-gobject' 'mono' 'xmltoman')
optdepends=('lib32-gtk3: gtk3 bindings'
            'lib32-gtk2: gtk2 bindings'
            'lib32-qt4: qt4 bindings')
options=(!emptydirs)
_commit=6242e5f0fe001b7de2ccaa9431db279b2ee76b83  # tags/v0.7
source=("git+$url#tag=$_commit"
        '0001-avahi-python-Use-the-agnostic-DBM-interface.patch')
sha256sums=('SKIP'
            '5e2347d73349cee56c17ef53b69418d0b083e2fe26d19af61ef2ba55ef43cf16')

pkgver() {
  cd ${pkgname#lib32-}
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ${pkgname#lib32-}
  patch -Np1 -i ../0001-avahi-python-Use-the-agnostic-DBM-interface.patch
  NOCONFIGURE=1 ./autogen.sh
}

  build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  export MOC_QT4=/usr/bin/moc-qt4 PYTHON=/usr/bin/python3

  cd ${pkgname#lib32-}
  ./configure \
    --build=i686-pc-linux-gnu \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libdir=/usr/lib32 \
    --disable-monodoc \
    --disable-qt3 \
    --enable-compat-libdns_sd \
    --with-distro=archlinux \
    --with-avahi-priv-access-group=network \
    --with-autoipd-user=avahi \
    --with-autoipd-group=avahi \
    --with-systemdsystemunitdir=/usr/lib/systemd/system
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  
  make
}

package() {
  cd ${pkgname#lib32-}
  make DESTDIR="${pkgdir}" install

  # Remove conflicting files.
  rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin,lib32/mono}}
}
