# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

pkgname=libdigidocpp-git
_pkgname=libdigidocpp
pkgver=4.6.0.r868.g974bf38
pkgrel=1
pkgdesc="Library for creating, signing and verification of digitally signed documents, according to XAdES and XML-DSIG standards (git master)"
arch=('x86_64')
url="https://github.com/open-eid/libdigidocpp"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'libxml2' 'libxslt' 'minizip' 'openssl' 'xmlsec' 'zlib')
backup=('etc/digidocpp/digidocpp.conf')
makedepends=('cmake' 'git')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/open-eid/libdigidocpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' \
    "$(sed -n 's/^project([^ ]* VERSION \([0-9.]*\).*/\1/p' CMakeLists.txt)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  BUILD_NUMBER=$(git -C "$_pkgname" rev-list --count HEAD) \
    cmake -B build -S "$_pkgname" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_SWIG=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Boost=TRUE
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
