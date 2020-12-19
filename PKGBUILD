# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=3.0.8
pkgrel=2
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('glibc' 'glib2' 'icu' 'db')
makedepends=('cmake' 'gtk-doc' 'doxygen' 'vala' 'gobject-introspection')
checkdepends=('python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        libical-glib-python-tests.patch
        icu68.patch)
sha512sums=('ce015e6d4c1c7cb4af7b45748ce8251c663f80f6a4357ddff6a97796642619abe882f4cadeca10cabeb1b25577869f436da15bca882e032eb3ff0475f6010d8b'
            '1b79b69ad4584b29259a656bed4ac1ee97cd3e7b65da478bfcdd51cecba2a9eb0375ecd6e796e289a58007ee03ed74bb4ab6f1488937dcd9329d296bfc438342'
            '58d4d32e82af39d1acc56135c601483f6df92915e43bd053374da28359cc4750014766def9cf6eafea2280f0f6c53d546691f035beaa15007e3b603c02a7986c')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../libical-glib-python-tests.patch
  patch -Np0 -i ../icu68.patch
}

build() {
  cmake -H"${pkgname}-${pkgver}" -Bbuild \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGOBJECT_INTROSPECTION=true \
    -DICAL_GLIB_VAPI=true \
    -DSHARED_ONLY=true
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
