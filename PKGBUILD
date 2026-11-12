# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=SZ3
pkgbase=sz3
pkgname=(sz3 paraview-sz3-plugin)
pkgver=3.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/szcompressor/$_name"
license=('LicenseRef-SZ3')
makedepends=('cmake'
             'zstd'
             'hdf5'
             'paraview'
             'cli11'
             'fast_float'
             'nlohmann-json')
checkdepends=('gtest')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e1559d291cd0b892350bd74ddb749ad4aa4d6fbba170e588eb54f325a529e0d')

build() {
  cd "$_name-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -DBUILD_TESTING=ON -DBUILD_H5Z_FILTER=ON -DBUILD_MDZ=ON -DBUILD_PARAVIEW_PLUGIN=ON -Wno-dev
  cmake --build build
  DESTDIR="$PWD"/build/install cmake --install build
}

check() {
  cd "$_name-$pkgver"
  ctest --test-dir build --output-on-failure
}

package_sz3() {
  pkgdesc="Modular error-bounded lossy compression framework for scientific data"
  depends=('glibc'
           'libgcc'
           'libgomp'
           'libstdc++'
           'zstd'
           'hdf5')
  cd "$_name-$pkgver"
  cp -a build/install/usr "$pkgdir"/
  rm -r "$pkgdir"/usr/lib/paraview "$pkgdir"/usr/lib/libvtkSZ3ReaderCS.a "$pkgdir"/usr/include/paraview_plugins "$pkgdir"/usr/include/paraview_plugins.h
  install -Dm644 copyright-and-BSD-license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_paraview-sz3-plugin() {
  pkgdesc="ParaView reader plugin for SZ3-compressed data"
  depends=('glibc'
           'libgcc'
           'libstdc++'
           'zstd'
           'paraview')
  cd "$_name-$pkgver"
  install -d "$pkgdir"/usr/lib "$pkgdir"/usr/include
  cp -a build/install/usr/lib/paraview build/install/usr/lib/libvtkSZ3ReaderCS.a "$pkgdir"/usr/lib/
  cp -a build/install/usr/include/paraview_plugins build/install/usr/include/paraview_plugins.h "$pkgdir"/usr/include/
  install -Dm644 copyright-and-BSD-license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
