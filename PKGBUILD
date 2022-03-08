# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=gtk
pkgname=lib32-gtk
pkgver=1.2.10
pkgrel=3
pkgdesc="A multi-platform toolkit (v1) (32-bit)"
arch=('x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('lib32-libxi' 'lib32-glib')
makedepends=('lib32-libxt' 'gcc-multilib' 'glib')
source=(https://download.gnome.org/sources/gtk+/1.2/gtk+-${pkgver}.tar.gz
        aclocal-fixes.patch)
sha1sums=('a5adcb909257da01ae4d4761e1d41081d06e4d7c'
          'b034e33efb85d27f3f3fb082c404e3b6ea79259f')

prepare() {
  cd gtk+-${pkgver}
  cp /usr/share/libtool/build-aux/config.guess .
  cp /usr/share/libtool/build-aux/config.sub .
  patch -p0 -i "${srcdir}/aclocal-fixes.patch"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" configure
}

build() {
  export CC="gcc -m32"
  export CFLAGS="${CFLAGS} -Wno-error -Wno-format -Wno-format-security"
  export CXXFLAGS="${CXXFLAGS} -Wno-error -Wno-format -Wno-format-security"
  cd gtk+-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
    --mandir=/usr/share/man --infodir=/usr/share/info \
    --with-xinput=xfree --libdir=/usr/lib32
  make
}

package() {
  cd gtk+-${pkgver}
  make DESTDIR="${pkgdir}" install
  # Cleanup for lib32 package
  rm -rf ${pkgdir}/usr/{include,share,bin}
  rm -rf ${pkgdir}/etc
}
