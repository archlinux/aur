# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=sadav
pkgname=$_reponame-git
pkgver=61.4d9feb3
sover=1
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='CalDAV/CardDAV client library and command line CalDAV/CardDAV client'
license=('GPL')
depends=('libdate-tz.so' 'libcurl.so' 'pugixml' 'libnotify.so')
checkdepends=('catch2')
makedepends=('cmake' 'git' 'ninja')
provides=('libsadav.so' 'cadav')
conflicts=($_reponame)
url="https://codeberg.org/trill/${_reponame}"
source=("${_reponame}::git+https://codeberg.org/trill/sadav.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_reponame}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_reponame}"
  echo "set_target_properties(sadav PROPERTIES SOVERSION r$sover)" >> libsadav/CMakeLists.txt
  echo 'install(TARGETS sadav)' >> libsadav/CMakeLists.txt
}

build() {
  cmake -G Ninja -S "${_reponame}" -B build \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON
  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D --target-directory="$pkgdir/usr/include/libsadav" "${_reponame}"/libsadav/*.h
}
