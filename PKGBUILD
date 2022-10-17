# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=3.0.15
pkgrel=2
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('glibc' 'glib2' 'icu' 'db' 'libxml2')
makedepends=('cmake' 'ninja' 'gtk-doc' 'doxygen' 'vala' 'gobject-introspection')
checkdepends=('python-gobject')
options=('debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
         https://github.com/libical/libical/commit/2ca167a6.patch)
sha512sums=('14f0eaabdd8fc56d91d2fff8647b3871439cceae3cb7af31eaae30b3cc29f818b6f9d582dd4770b8b3b0c6fe53684258d30c743a5fd5dd337fda64e3adae35ba'
            'fda913712c980ba7bb5e9f401bb4e787fcbc68ac051a73b8bc0c102cbd91c2a105293297da83637b9993d5475a5f87b06e5556a65699b5e150d0dada86ef00f4')

prepare() {
  patch -d $pkgname-$pkgver -Rp1 < 2ca167a6.patch # Fix breakage when parsing ical events
}

build() {
  cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DGOBJECT_INTROSPECTION=true \
    -DICAL_GLIB_VAPI=true \
    -DSHARED_ONLY=true
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
