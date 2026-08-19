pkgbase="musepack-znver4-git"
pkgname=('libmpcdec-znver4-git' 'musepack-tools-znver4-git')
pkgver=15feced
pkgrel=1
pkgdesc="Musepack SV8 encoder/decoder with FAST_MATH fixes (git version, ZNVER4 optimized)"
arch=('x86_64')
url="https://github.com/tatsuz/musepack"
license=('LGPL')
conflicts=('libmpcdec' 'libmpcdec-git' 'musepack-tools-git')
makedepends=('git' 'cmake' 'make')
source=("git+https://github.com/tatsuz/musepack.git"
        "musepack-fixes.patch")
sha256sums=('SKIP'
            'e906fbebb619672c4b945fc70101d41945e4628ba97d85b7c8bf4579b3c41a3f')

pkgver() {
  cd "$srcdir/musepack"
  git describe --always --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$srcdir/musepack"

  patch -p1 < "$srcdir/musepack-fixes.patch"

  sed -i 's/m->SCF_Index_L/(const int (*)[3]) m->SCF_Index_L/' libmpcpsy/ans.c
  sed -i 's/m->SCF_Index_R/(const int (*)[3]) m->SCF_Index_R/' libmpcpsy/ans.c

  sed -i 's/target_link_libraries(mpcdec_cmd mpcdec)/target_link_libraries(mpcdec_cmd mpcdec_shared)/' mpcdec/CMakeLists.txt
  sed -i 's/target_link_libraries(mpccut mpcdec)/target_link_libraries(mpccut mpcdec_shared)/' mpccut/CMakeLists.txt
}

build() {
  cp -r "$srcdir/musepack" "$srcdir/musepack-znver4"
  cd "$srcdir/musepack-znver4"

    BASE_CFLAGS="-O3 -march=znver4 -mtune=znver4 \
                -falign-functions=32 -falign-loops=32 \
                -fno-math-errno -fno-trapping-math \
                -fno-semantic-interposition \
                -fomit-frame-pointer -fno-plt \
                -pipe -flto -Wall -Wno-unused \
                -fstrict-aliasing -fno-rtti -fno-exceptions \
                -fmerge-all-constants -ffunction-sections \
                -fdata-sections"

  BASE_CXXFLAGS="$BASE_CFLAGS"
  BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

  # Clang-only flags
  CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
  CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
  CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

  # Detect compiler
  if command -v clang >/dev/null 2>&1; then
      export CC=clang
      export CXX=clang++
      export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
      export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
      export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
  else
      export CC=gcc
      export CXX=g++
      export CFLAGS="$BASE_CFLAGS"
      export CXXFLAGS="$BASE_CXXFLAGS"
      export LDFLAGS="$BASE_LDFLAGS"
  fi

  cmake -DSHARED=ON \
        -DCMAKE_BUILD_TYPE=ZNVER4 \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Wno-author .

  make -j$(nproc)
}

package_libmpcdec-znver4-git() {
  pkgdesc="Musepack decoding library (ZNVER4 optimized git version)"
  depends=('glibc')
  conflicts=('libmpcdec' 'libmpcdec-git')
  provides=('libmpcdec')

  cd "$srcdir/musepack-znver4"

  find . -type f -name "libmpcdec.so*" -exec install -Dm755 {} "$pkgdir/usr/lib/{}" \;

  install -d "$pkgdir/usr/include/mpc"
  cp -r include/mpc/* "$pkgdir/usr/include/mpc/"
}

package_musepack-tools-znver4-git() {
  pkgdesc="Musepack SV8 encoder/decoder tools (ZNVER4 optimized git version)"
  depends=('glibc' 'libmpcdec-znver4-git')
  conflicts=('musepack-tools-git')

  cd "$srcdir/musepack-znver4"

  install -Dm755 mpcenc/mpcenc "$pkgdir/usr/bin/mpcenc"
  install -Dm755 mpcdec/mpcdec "$pkgdir/usr/bin/mpcdec"
  install -Dm755 mpccut/mpccut "$pkgdir/usr/bin/mpccut"
  install -Dm755 wavcmp/wavcmp "$pkgdir/usr/bin/wavcmp"
}
