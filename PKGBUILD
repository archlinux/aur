# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens at gmail dot com>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Douglas Soares de Andrade <douglas at archlinux dot org>

_name="avahi"
pkgname="lib32-${_name}"
_commit_rel="f060abee2807c943821d88839c013ce15db17b58" # 0.8
_commit="3f79789c484518f82c36ff59c0f45abe7e6580a2" # r194
pkgver="0.8+r194+g${_commit::7}"
pkgrel=1
pkgdesc="Service Discovery for Linux using mDNS/DNS-SD (compatible with Bonjour) (32-bit)"
arch=('x86_64')
url="https://github.com/avahi/${_name}"
license=('LGPL-2.1-or-later')
depends=('lib32-dbus' 'lib32-expat' 'lib32-gdbm' 'lib32-glib2' 'lib32-glibc'
         'lib32-libcap' 'lib32-libdaemon' 'lib32-systemd' "${_name}")
makedepends=('glib2-devel' 'gobject-introspection' 'lib32-gtk3'
             'lib32-libevent' 'python-dbus' 'python-gobject' 'xmltoman') # 'lib32-qt5-base'
optdepends=('lib32-gtk3: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc'
            'lib32-libevent: libevent bindings')
provides=("lib${_name}-"{client,common,core,glib,gobject,libevent,ui-gtk3}".so" # ,qt5
          'libdns_sd.so')
backup=("usr/lib32/${_name}/service-types.db")
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "0001-HACK-Install-fixes.patch")
sha512sums=('e81d7a2844ab539a348a074f8dbcb90bdde81876f918c6ec6f98bd54d33ccbe32b51d345e60680ecdd7801d473254d150a42abc392bec4672321d85a576c48bc'
            '0cbea74889b2f9d767ff6d8df93f020112eac5ca64a6b9f9ecf3dda1d1b5423a5fe0c46f3845351502ec6d990c51d58434c394182f159bccd38c38c2ddc65f6d')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/0001-HACK-Install-fixes.patch"

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --disable-mono \
    --disable-qt5 \
    --enable-compat-libdns_sd \
    --with-autoipd-group="${_name}" \
    --with-autoipd-user="${_name}" \
    --with-avahi-priv-access-group='network' \
    --with-distro='archlinux' \
    --with-dbus-sys='/usr/share/dbus-1/system.d' \
    --with-systemdsystemunitdir='/usr/lib/systemd/system'
    # --sbindir='/usr/bin' 
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "etc" "include" "lib" "share"
  mv -f "sbin" "bin"
}
