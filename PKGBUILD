# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens at gmail dot com>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Douglas Soares de Andrade <douglas at archlinux dot org>

pkgname=lib32-avahi
pkgver=0.7+18+g1b5f401
pkgrel=1
pkgdesc='Service Discovery for Linux using mDNS/DNS-SD -- compatible with Bonjour (32-bit)'
arch=('x86_64')
url='https://github.com/lathiat/avahi'
license=('LGPL')
depends=("${pkgname#lib32-}" 'expat' 'lib32-gdbm' 'lib32-glib2' 'lib32-libcap' 'lib32-libdaemon' 'lib32-dbus')
makedepends=('gcc-multilib' 'git' 'gobject-introspection' 'gtk-sharp-2' 'intltool' 'lib32-gtk2' 'lib32-gtk3'
             'pygtk' 'python-dbus' 'python-gobject' 'mono' 'xmltoman')
optdepends=('lib32-gtk3: gtk3 bindings'
            'lib32-gtk2: gtk2 bindings')
options=(!emptydirs)
_commit=1b5f401f64d7bed40c4335b0327acf4125da3086  # pull/115/merge~2
source=("git+$url#tag=$_commit")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname#lib32-}
  # CVE-2017-6519 CVE-2018-100084
  git cherry-pick -n e111def44a7df4624a4aa3f85fe98054bffb6b4f
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

  export PYTHON=/usr/bin/python3

  cd ${pkgname#lib32-}
  ./configure \
    --build=i686-pc-linux-gnu \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libdir=/usr/lib32 \
    --disable-monodoc \
    --disable-qt4 \
    --disable-qt5 \
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
