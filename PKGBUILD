# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=3.0.18
pkgrel=2
pkgdesc="Implementation of iCalendar protocols and data formats"
url="https://github.com/libical/libical"
arch=(x86_64)
license=("MPL-2.0 OR LGPL-2.1-only")
depends=(
  gcc-libs
  glib2
  glibc
  icu
  libxml2
)
makedepends=(
  cmake
  doxygen
  git
  gobject-introspection
  gtk-doc
  ninja
  vala
)
checkdepends=(python-gobject)
source=(
  "git+$url#tag=v$pkgver"
  0001-Fix-build-with-ICU-75.patch
  0002-HACK-Disable-failing-test.patch
)
b2sums=('39fe3732b985fa2ab819a890d7310192e92174f2a5a2e150909fee1315b171ff67a38958fdd2311b557946a1b6d051c1e66545fe1d5def3c9ab9b6f3fc3fdc05'
        '926be2cbc0513cbee4a67abe4fee6cc4149c5a45ccfa6e71869db423ae2248b07a6417d2574e31ba25637f347faba9a56251e36d58953b4660daf4d0973be83d'
        'bd2973318715ba605231c6dbe030c9837872fb604b248842dbfbc4c59d902501c8cf01173918111b6d52a1223eb36f9d046276a4e964e570b10e274c1a8b689e')

prepare() {
  cd $pkgname

  # ICU 75 compatibility
  # https://github.com/libical/libical/issues/684
  git apply -3 ../0001-Fix-build-with-ICU-75.patch
  git apply -3 ../0002-HACK-Disable-failing-test.patch
}

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_DISABLE_FIND_PACKAGE_BerkeleyDB=true
    -D CMAKE_INSTALL_LIBEXECDIR=lib
    -D CMAKE_INSTALL_PREFIX=/usr
    -D GOBJECT_INTROSPECTION=true
    -D ICAL_GLIB_VAPI=true
    -D SHARED_ONLY=true
  )

  cmake -S $pkgname -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
