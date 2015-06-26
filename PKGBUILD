# Maintainer: Matt Boswell <mordervomubel+archlinux at lockmail.us>
# Previous Maintainer: josephgbr <rafael.f.f1 at gmail dot com>

_pkgbase=gnome-vfs
pkgname=lib32-$_pkgbase
pkgver=2.24.4
pkgrel=11
pkgdesc="The GNOME Virtual File System (32 bit)"
arch=('x86_64')
license=('LGPL')
depends=('gnome-vfs' 'lib32-gconf' 'lib32-bzip2' 'lib32-avahi' 'lib32-smbclient' 'lib32-krb5' 'lib32-gnutls' 'lib32-libgcrypt')
makedepends=('gnome-mime-data' 'pkgconfig' 'intltool' 'gtk-doc' 'gnome-common' 'lib32-dbus-glib' 'lib32-keyutils')
options=('!libtool' '!emptydirs' '!docs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbase}/2.24/$_pkgbase-${pkgver}.tar.bz2
        gnutls-config.patch
        gnutls-3.4.0.patch
        gcrypt-config.patch
        enable-deprecated.patch)
sha256sums=('62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa'
            '66c7cfb12995c0dd94a2caea95c7e3c55981993f05a79c585d60915ff131955d'
            '5fe5e2e1ad8d8d36deb2d38db621d5b8350aafe3876f722467465c3b3fa304d3'
            'c059e218f310da683778919d36e7862f7e763384805f6453d328fbaf507a8114'
            'ca2b9dffb1fa202c0d1f0d3648ef37cd8e84657a22d4c6746bb46e9a6cf1ee47')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  
  #Fix build with new gnutls
  patch -Np1 -i ../gnutls-config.patch
  patch -Np1 -i ../gnutls-3.4.0.patch
  #fix build with new libgcrypt >= 1.5.0
  patch -Np1 -i ../gcrypt-config.patch
  # remove -DG_DISABLE_DEPRECATED
  patch -Np1 -i ../enable-deprecated.patch

  sed -i -s 's|$(srcdir)/auto-test|auto-test|' test/Makefile.am
}
build() {
  export CC='gcc -m32 -Dg_memmove=memmove'
  export CXX='g++ -m32 -Dg_memmove=memmove'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
        
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  libtoolize --force
  gtkdocize
  aclocal
  autoconf
  automake --add-missing
  CFLAGS="$CFLAGS -fno-strict-aliasing" ./configure \
      --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib32/gnome-vfs-2.0 \
      --enable-samba --with-samba-includes=/usr/include/samba-4.0 \
      --disable-hal --enable-avahi --disable-howl \
      --disable-openssl --enable-gnutls \
	  --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/{etc,usr/{bin,include,share}}
}
