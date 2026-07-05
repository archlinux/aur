# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens at gmail dot com>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Douglas Soares de Andrade <douglas at archlinux dot org>

_name="avahi"
pkgname="lib32-${_name}"
pkgver=0.9rc5
pkgrel=1
pkgdesc="Service Discovery for Linux using mDNS/DNS-SD (compatible with Bonjour) (32-bit)"
arch=(
  'x86_64'
)
url="https://github.com/${_name}/${_name}"
license=(
  'LGPL-2.1-or-later'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-dbus>=0.34'
  'lib32-gdbm'
  'lib32-glib2>=2.4'
  'lib32-glibc'
)
makedepends=(
  'glib2-devel'
  'lib32-gtk3'
  'lib32-libevent'
  # 'lib32-qt5-base'
)
optdepends=(
  'lib32-gtk3: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc'
  'lib32-libevent>=2.0.21: libevent bindings'
)
provides=(
  "lib${_name}-"{client,common,core,glib,gobject,libevent,ui-gtk3}".so" # ,qt5
  'libdns_sd.so'
)
backup=(
  # "usr/lib32/${_name}/service-types.db"
)
_pkgsrc="${url##*/}-${pkgver/[a-z]/-&}"
source=(
  "${url}/archive/refs/tags/v${pkgver/[a-z]/-&}/${_pkgsrc}.tar.gz"
  "0001-HACK-Install-fixes.patch"
)
sha512sums=('8afe102be275b9714a920c5bd31ea7e317c54574385ff38cac8ffbb9bf5cbdd0110a2df8439aefdffb4711c257f86494517b1dd27da3a5d5ff623808634b523d'
            '0cbea74889b2f9d767ff6d8df93f020112eac5ca64a6b9f9ecf3dda1d1b5423a5fe0c46f3845351502ec6d990c51d58434c394182f159bccd38c38c2ddc65f6d')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/0001-HACK-Install-fixes.patch"

  sed -E ':a;N;s/\\\n\t(avahi-discover-standalone|avahi-utils|man|po)//;ba' \
      -i 'Makefile.am'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --sysconfdir='/etc'
    --localstatedir='/var'
    --sbindir='/usr/bin'
    --runstatedir='/run'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --enable-gobject
    --disable-gtk
    --enable-gtk3
    --enable-dbus
    --with-xml=none
    --enable-gdbm
    --disable-dbm
    --disable-libdaemon
    --disable-libsystemd
    --disable-python
    --disable-pygobject
    --disable-python-dbus
    --disable-qt3
    --disable-qt4
    --disable-qt5
    --disable-mono
    --disable-monodoc
    --with-distro='archlinux'
    --with-avahi-user="${_name}"
    --with-avahi-group="${_name}"
    --with-avahi-priv-access-group='network'
    --with-autoipd-user="${_name}"
    --with-autoipd-group="${_name}"
    --disable-stack-protector # respect build flags
    --with-systemdsystemunitdir='/usr/lib/systemd/system'
    --with-dbus-sys='/usr/share/dbus-1/system.d'
    --enable-compat-libdns_sd
    --enable-tests
    --disable-core-docs
    --disable-autoipd
    --disable-manpages
    --disable-xmltoman
    --disable-introspection
  )

  cd "${srcdir}/${_pkgsrc}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"
  rm -rf "etc"

  cd "usr"
  rm -rf "bin" "include" "lib" "sbin" "share"

  cd "lib32"
  rm -rf "girepository-1.0"
}
