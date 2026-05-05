# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=sigviewer
pkgver=0.7.1
pkgrel=2
pkgdesc="A viewing application for biosignals"
arch=('x86_64')
url="https://github.com/cbrnr/sigviewer"
license=('GPL')
depends=('qt6-base' 'libbiosig' 'libxdf')
makedepends=('cmake')
source=(https://github.com/cbrnr/sigviewer/archive/v$pkgver.zip
        sigviewer.desktop)
sha256sums=('1e8a95fa3b711a4a9ad3058f60f7266358c88f1f7dd791e2cc64621d272870ea'
            'd6c1f691429d97876607bbd56ac6387ab11bef3f700b236a9504d04ad1728333')

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
  install -Dm755 "$srcdir/sigviewer-$pkgver/build/sigviewer" "$pkgdir/usr/bin/sigviewer"
  install -Dm644 sigviewer.desktop "$pkgdir/usr/share/applications/sigviewer.desktop"
  install -Dm644 "$srcdir/sigviewer-$pkgver/sigviewer.svg" "$pkgdir/usr/share/icons/sigviewer.svg"
}
