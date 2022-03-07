# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=glib
pkgname=lib32-glib
pkgver=1.2.10
pkgrel=5
pkgdesc="Common C routines used by Gtk+ and other libs (32-bit)"
arch=('x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('lib32-glibc' 'sh')
makedepends=('gcc-multilib')
options=('!makeflags')
source=(https://download.gnome.org/sources/glib/1.2/${_pkgname}-${pkgver}.tar.gz
	glib-1.2.10-gcc9.patch
	gcc340.patch aclocal-fixes.patch glib1-autotools.patch)
sha1sums=('e5a9361c594608d152d5d9650154c2e3260b87fa'
          '9e675101003cd97da0b42bf04fc6489197a822c7'
          'a2cc224a66aeffdcac16ebd9e8af18143cf54918'
          'ae4438cf56c0c9264ee36f6973fb445f9a820be0'
          '8a25fde3c79567262b3024f4e74c9ca4ee8a6279')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/gcc340.patch"
  patch -Np0 -i "${srcdir}/glib-1.2.10-gcc9.patch"
  patch -Np0 -i "${srcdir}/aclocal-fixes.patch"
  patch -Np1 -i "${srcdir}/glib1-autotools.patch"
  sed -i -e 's/ifdef[[:space:]]*__OPTIMIZE__/if 0/' glib.h
}

build() {
  export CFLAGS="${CFLAGS} -Wno-error -Wno-format -Wno-format-security"
  export CXXFLAGS="${CXXFLAGS} -Wno-error -Wno-format -Wno-format-security"
  export CC="gcc -m32"
  cd ${_pkgname}-${pkgver}
  if [[ $CARCH = "i686" ]]; then
    CONFIGFLAG='--host=i686-pc-linux-gnu --target=i686-pc-linux-gnu'
  elif [[ $CARCH = "x86_64" ]]; then
    CONFIGFLAG='--host=x86_64-unknown-linux-gnu --target=x86_64-unknown-linux-gnu'
  fi

  rm aclocal.m4 acinclude.m4
  echo 'LT_INIT' >> configure.in
  autoreconf --install --force
  ./configure --prefix=/usr --libdir=/usr/lib32 --mandir=/usr/share/man \
    --infodir=/usr/share/info $CONFIGFLAG
  make
}

check() {
  cd ${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  # Cleanup for lib32 package
  rm -rf ${pkgdir}/usr/{include,share,bin}
}
