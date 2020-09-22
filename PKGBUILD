# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens at gmail dot com>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Douglas Soares de Andrade <douglas at archlinux dot org>

pkgname=lib32-avahi
pkgver=0.8+15+ge8a3dd0
pkgrel=1
pkgdesc='Service Discovery for Linux using mDNS/DNS-SD -- compatible with Bonjour (32-bit)'
arch=('x86_64')
url='https://github.com/lathiat/avahi'
license=('LGPL')
depends=("${pkgname#lib32-}" 'expat' 'lib32-dbus' 'lib32-gdbm' 'lib32-glib2' 'lib32-libcap' 'lib32-libdaemon')
makedepends=('git' 'gobject-introspection' 'libevent' 'lib32-libevent'
             'lib32-gtk3' 'python-dbus' 'python-gobject' 'xmltoman')
optdepends=('lib32-gtk3: gtk3 bindings'
            'lib32-libevent: libevent bindings')
options=(!emptydirs)
_commit=e8a3dd0d480a754318e312e6fa66fea249808187  # master
source=("git+$url#tag=$_commit")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname#lib32-}
  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd ${pkgname#lib32-}
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd ${pkgname#lib32-}
  ./configure \
    --build=i686-pc-linux-gnu \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libdir=/usr/lib32 \
    --disable-mono \
    --disable-qt5 \
    --enable-compat-libdns_sd \
    --with-distro=archlinux \
    --with-avahi-priv-access-group=network \
    --with-autoipd-user=avahi \
    --with-autoipd-group=avahi \
    --with-dbus-sys=/usr/share/dbus-1/system.d \
    --with-systemdsystemunitdir=/usr/lib/systemd/system 
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  
  make
}

package() {
  cd ${pkgname#lib32-}
  make DESTDIR="${pkgdir}" install

  # Remove conflicting files.
  rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin}}
}
