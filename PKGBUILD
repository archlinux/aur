# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=sigviewer
pkgver=0.7.0
pkgrel=1
pkgdesc="A viewing application for biosignals"
arch=('i686' 'x86_64')
url="https://github.com/cbrnr/sigviewer"
license=('GPL')
groups=()
depends=('qt6-base' 'libbiosig' 'libxdf')
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/cbrnr/sigviewer/archive/v$pkgver.zip
        sigviewer.desktop)
noextract=()
sha1sums=('f652911a7d0c405ad5bf62ab4d3464b53d8b4638'
          '72fc9741a985ef783c2c3e7ea5b51655ebc94d84')

build() {
  cd "$srcdir/sigviewer-$pkgver"
  cat <<EOF > external/versions.cmake
set(LIBXDF_VERSION_INSTALLED    "0.99.10")
set(LIBBIOSIG_VERSION_INSTALLED "3.9.4")
EOF
  sed -i '/include(external\/versions.cmake)/d' CMakeLists.txt
  sed -i '/add_library(dep_libxdf/,/)/c\add_library(dep_libxdf INTERFACE IMPORTED GLOBAL)\ntarget_link_libraries(dep_libxdf INTERFACE xdf)' CMakeLists.txt
  sed -i '/add_library(dep_libbiosig/,/)/c\add_library(dep_libbiosig INTERFACE IMPORTED GLOBAL)\ntarget_link_libraries(dep_libbiosig INTERFACE biosig)' CMakeLists.txt
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons"
  install -Dm755 "$srcdir/sigviewer-$pkgver/build/sigviewer" "$pkgdir/usr/bin"
  install -Dm644 sigviewer.desktop "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/sigviewer-$pkgver/sigviewer.svg" "$pkgdir/usr/share/icons"
}
