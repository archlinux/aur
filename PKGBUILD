# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=1.3
pkgrel=1
_prefix="/usr/lib/ikos-$pkgver"
pkgdesc='A static analysis tool for C/C++ developed by NASA'
arch=('any')
url='https://ti.arc.nasa.gov/opensource/ikos/'
license=('custom:NOSA 1.3')
depends=('gmp' 'boost-libs' 'python' 'sqlite' 'llvm40' 'llvm40-libs' 'clang40')
makedepends=('cmake' 'boost')
source=("https://ti.arc.nasa.gov/m/opensource/downloads/ikos-$pkgver.tar.gz"
        "https://ti.arc.nasa.gov/m/opensource/downloads/ikos/IKOS_NASA_Open_Source_Agreement.pdf"
        "CMakeLists.patch")
sha512sums=('cec1b914bd1a7ca449098a2393baae35f066498ef99982f7b876aaa1590ea0e752441336093184285dccce392a326824a7a1e47cc04e9406df826870874fa147'
            '3caeffbe06254b3a181eee1f172bde48d7c8007e989b07928b0ce4e737759d5e2649d25419722c3b7a78ca8ddf408ce150a143490489641527cbcac479c241b7'
            '59b0fc0cd11979b2d341c776efcbc4acb8ef514610dbd04d2436a8a56f8daa6f7eb3041691770ca62037911f255bb6926fafa9d81d574ed2f13111a4d39a474c')

prepare() {
  cd "$srcdir/ikos-$pkgver"

  mkdir build

  patch -Np0 < ../CMakeLists.patch
}

build() {
  cd "$srcdir/ikos-$pkgver/build"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${_prefix}" \
    -DLLVM_CONFIG_EXECUTABLE="/usr/bin/llvm-config-4.0" \
    ..

  make
}

package() {
  cd "$srcdir/ikos-$pkgver/build"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/IKOS_NASA_Open_Source_Agreement.pdf" "${pkgdir}${_prefix}/share/licenses/ikos/LICENSE"

  # add symbolic links in /usr/bin
  mkdir -p "$pkgdir/usr/bin"
  cd "${pkgdir}${_prefix}"/bin
  for f in *; do
    ln -s "${_prefix}/bin/$f" "$pkgdir/usr/bin/$f"
  done
}
