# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=imlib
pkgver=1.9.15
pkgrel=17
pkgdesc="General image handling library for X11 and Gtk"
arch=('x86_64')
url="http://freshmeat.net/projects/imlib/"
license=('GPL')
depends=('giflib' 'libpng' 'libtiff' 'libxext')
makedepends=('libxt')
source=(https://ftp.gnome.org/pub/GNOME/sources/imlib/1.9/${pkgname}-${pkgver}.tar.bz2
        debian-bug448360.patch CAN-2004-1026.patch aclocal-fixes.patch 
        imlib-1.9.15-libpng15.patch imlib-giflib51.patch imlib-gtk.patch)
sha512sums=('f50d9141b3c54b44921aa09c0a5ea848aefaa904efdd6da132dace42604671f8dbd3e4b71a596f054f0db4525ba2002864b5e5b21f8805cf1b5514b661ac254a'
            '0c805568c54149239a3106293e7a4f5abe127abebc1a851cda87958fede996d6c0415fe1b47a7f023f2deb2e3460204d5aae4fce5787e402a026d46c2e7e662c'
            'a75537267e9e276920fbc0360cd4832f727c6c9857401889bdb1466f3088c98e5ea2ef84a94a5873a3c12dda0b9aed36a5e2039fece87e51154a3b773d97aa5c'
            'ca4d2a047ee07f25bb462c8b34fc8298ef9a31b39f83309598a696973534e144f8f02a130bb764737dfbd329073e64abe4f8a673d66731822fece4969d7ab02a'
            'e7a6d48ef04fbcfcab998e6968130796ab3da1fd9def14ab2ccc713e0956f1f2be3f3a8f680ded5f00cb7ac9ea31d2f94de04aaa039ec5b03cece71f36f14294'
            '91a62ed701974b953c2bc4f6b530ea7614b2195906110fcdc45bb200acacea0c54d431c3eafdcd2b33877606ef6b23bd34d051f99f90e5505d8e725b78278c89'
            'fb05c545e8c8e3eaf6a6cc390c0c9211c37074f7bd6805529254d9c61d56ceb9b2e3877d276f46ac0b195ae796e52c5baad11781ef91272c955529396bdf6de7')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/debian-bug448360.patch"
  patch -p1 -i "${srcdir}/CAN-2004-1026.patch"
  patch -p0 -i "${srcdir}/aclocal-fixes.patch"
  patch -p0 -i "${srcdir}/imlib-1.9.15-libpng15.patch"
  patch -p1 -i "${srcdir}/imlib-giflib51.patch"
  patch -p1 -i "${srcdir}/imlib-gtk.patch"
  sed '/AC_PATH_XTRA/d' -i configure.in
  mv configure.in configure.ac
  libtoolize --force
  cp /usr/bin/libtool .
}

build() {
  cd ${pkgname}-${pkgver}
  autoreconf --force --install
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --enable-shm --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
