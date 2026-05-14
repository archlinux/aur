# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical3
pkgver=3.0.20
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format (version 3)"
arch=('x86_64')
url='https://github.com/libical/libical'
license=('LGPL-2.1-only' 'MPL-2.0')
depends=('glibc' 'glib2' 'icu' 'libgcc' 'libstdc++' 'libxml2')
makedepends=('cmake' 'ninja' 'gtk-doc' 'doxygen' 'vala' 'gobject-introspection')
checkdepends=('python-gobject')
source=("libical-${pkgver}.tar.gz::https://github.com/libical/libical/archive/v${pkgver}.tar.gz")
sha512sums=('2506320240ba0e4287b6ef1b90b653eacd51105d392b91f8c772f3b0745fecbf55eecfe81f89413cc56106b71ccca780754df31f5190ffce6c372126e27bf1da')

build() {
  cmake -S "libical-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DATAROOTDIR=share/libical3 \
    -DCMAKE_INSTALL_INCLUDEDIR=include/libical3 \
    -DCMAKE_INSTALL_LIBDIR=lib/libical3 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/libical3 \
    -DGOBJECT_INTROSPECTION=true \
    -DICAL_GLIB_VAPI=true \
    -DSHARED_ONLY=true \
    -DCMAKE_DISABLE_FIND_PACKAGE_BerkeleyDB=true
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  sed -i 's"^includedir=.*$"&/libical3"' "${pkgdir}/usr/lib/libical3/pkgconfig/"*.pc
  mv "${pkgdir}/usr/lib/libical3/"*.so.* "${pkgdir}/usr/lib"
  ln -sf ../libical.so.3 "${pkgdir}/usr/lib/libical3/libical.so"
  ln -sf ../libical_cxx.so.3 "${pkgdir}/usr/lib/libical3/libical_cxx.so"
  ln -sf ../libical-glib.so.3 "${pkgdir}/usr/lib/libical3/libical-glib.so"
  ln -sf ../libicalss.so.3 "${pkgdir}/usr/lib/libical3/libicalss.so"
  ln -sf ../libicalss_cxx.so.3 "${pkgdir}/usr/lib/libical3/libicalss_cxx.so"
  ln -sf ../libicalvcal.so.3 "${pkgdir}/usr/lib/libical3/libicalvcal.so"
}
