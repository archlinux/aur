# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=sigviewer
pkgver=0.7.3
pkgrel=1
pkgdesc="A viewing application for biosignals"
arch=('x86_64')
url="https://github.com/cbrnr/sigviewer"
license=('GPL')
depends=('qt6-base' 'libbiosig' 'libxdf')
makedepends=('cmake')
source=(https://github.com/cbrnr/sigviewer/archive/v0.7.3.zip
        sigviewer.desktop)
sha256sums=('bbbf93cd6dd41b202d955b9ded876647d67a5b453af5443a96cf97e2dbcf22f3'
            'd6c1f691429d97876607bbd56ac6387ab11bef3f700b236a9504d04ad1728333')

build() {
  cd "$srcdir/sigviewer-$pkgver"
  cat <<EOF > external/versions.cmake
set(LIBXDF_VERSION_INSTALLED    "1.0.1")
set(LIBBIOSIG_VERSION_INSTALLED "3.9.5")
EOF
  sed -i '/include(external\/versions.cmake)/d' CMakeLists.txt
  sed -i '/add_library(dep_libxdf/,/)/c\add_library(dep_libxdf INTERFACE IMPORTED GLOBAL)\ntarget_link_libraries(dep_libxdf INTERFACE xdf)' CMakeLists.txt
  sed -i '/add_library(dep_libbiosig/,/)/c\add_library(dep_libbiosig INTERFACE IMPORTED GLOBAL)\ntarget_link_libraries(dep_libbiosig INTERFACE biosig)' CMakeLists.txt
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -Dm755 "$srcdir/sigviewer-$pkgver/build/sigviewer" "$pkgdir/usr/bin/sigviewer"
  install -Dm644 sigviewer.desktop "$pkgdir/usr/share/applications/sigviewer.desktop"
  install -Dm644 "$srcdir/sigviewer-$pkgver/sigviewer.svg" "$pkgdir/usr/share/icons/sigviewer.svg"
}
