pkgname=jm-git
pkgver=19.0.r110.g8b34eee
pkgrel=1
pkgdesc="JM H.264 reference encoder/decoder, development build"
arch=('x86_64')
url="https://vcgit.hhi.fraunhofer.de/jvet/JM"
license=('ITU')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("git+https://vcgit.hhi.fraunhofer.de/jvet/JM.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/JM"
  printf "19.0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/JM"

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_ADDRESS_SANITIZER=OFF \
    -DBUILD_STATIC=OFF \
    -DSET_ENABLE_SPLIT_PARALLELISM=ON \
    -DENABLE_SPLIT_PARALLELISM=ON \
    -DSET_ENABLE_WPP_PARALLELISM=ON \
    -DENABLE_WPP_PARALLELISM=ON \
    -DCMAKE_C_FLAGS="-Wno-unused-variable -Wno-unused-but-set-variable -Wno-maybe-uninitialized" \
    -DCMAKE_CXX_FLAGS="-Wno-unused-variable -Wno-unused-but-set-variable -Wno-maybe-uninitialized"

  make -j"$(nproc)"
}

package() {
  cd "$srcdir/JM"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  # install binaries
  find bin/umake/gcc-16.1/x86_64/release -maxdepth 1 -type f -executable \
    -exec install -m755 {} "$pkgdir/usr/bin/" \;

  # Merge licenses
  cat COPYRIGHT_ITU.txt COPYRIGHT_ISO_IEC.txt > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
