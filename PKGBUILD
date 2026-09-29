# Maintainer: Thomas Roos (Roosted) <thomas@thomasroos.nl>

pkgname=jpegli-tools-git
pkgver=0.12.0.r2989.g031a007
pkgrel=1
pkgdesc='Improved JPEG encoder and decoder command-line tools (cjpegli and djpegli)'
arch=('x86_64')
url='https://github.com/google/jpegli'
license=('BSD-3-Clause')
depends=(
  'giflib'
  'glibc'
  'highway'
  'lcms2'
  'libgcc'
  'libjpeg-turbo'
  'libpng'
  'libstdc++'
  'zlib'
)
makedepends=(
  'asciidoc'
  'cmake'
  'git'
  'ninja'
)
provides=("jpegli-tools=$pkgver")
conflicts=(
  'jpegli-tools'
  'jpegli-git'
  'libjxl<0.12.0'
)
source=(
  'jpegli::git+https://github.com/google/jpegli.git'
  'libjpeg-turbo::git+https://github.com/libjpeg-turbo/libjpeg-turbo.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd jpegli

  local major minor patch
  major=$(sed -n 's/^set(JPEGLI_MAJOR_VERSION \([0-9][0-9]*\))$/\1/p' lib/CMakeLists.txt)
  minor=$(sed -n 's/^set(JPEGLI_MINOR_VERSION \([0-9][0-9]*\))$/\1/p' lib/CMakeLists.txt)
  patch=$(sed -n 's/^set(JPEGLI_PATCH_VERSION \([0-9][0-9]*\))$/\1/p' lib/CMakeLists.txt)

  printf '%s.%s.%s.r%s.g%s' \
    "$major" "$minor" "$patch" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd jpegli

  # jpegli uses these libjpeg-turbo source headers/templates even when its
  # drop-in libjpeg.so replacement is disabled. Point the submodule at the
  # makepkg-managed source checkout so prepare/build need no network access.
  git submodule init third_party/libjpeg-turbo
  git config submodule.third_party/libjpeg-turbo.url "$srcdir/libjpeg-turbo"
  git -c protocol.file.allow=always submodule update third_party/libjpeg-turbo
}

build() {
  cd jpegli

  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DJPEGLI_VERSION="$pkgver" \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DJPEGLI_ENABLE_TOOLS=ON \
    -DJPEGLI_ENABLE_DEVTOOLS=OFF \
    -DJPEGLI_ENABLE_BENCHMARK=OFF \
    -DJPEGLI_ENABLE_FUZZERS=OFF \
    -DJPEGLI_ENABLE_JNI=OFF \
    -DJPEGLI_ENABLE_DOXYGEN=OFF \
    -DJPEGLI_ENABLE_MANPAGES=ON \
    -DJPEGLI_ENABLE_JPEGLI_LIBJPEG=OFF \
    -DJPEGLI_INSTALL_JPEGLI_LIBJPEG=OFF \
    -DJPEGLI_ENABLE_SJPEG=OFF \
    -DJPEGLI_ENABLE_OPENEXR=OFF \
    -DJPEGLI_ENABLE_SKCMS=OFF \
    -DJPEGLI_ENABLE_TCMALLOC=OFF \
    -DJPEGLI_BUNDLE_LIBPNG=OFF \
    -DJPEGLI_FORCE_SYSTEM_HWY=ON \
    -DJPEGLI_FORCE_SYSTEM_LCMS2=ON

  cmake --build build --target cjpegli djpegli manpages
}

package() {
  cd jpegli

  install -Dm755 build/tools/cjpegli "$pkgdir/usr/bin/cjpegli"
  install -Dm755 build/tools/djpegli "$pkgdir/usr/bin/djpegli"

  install -Dm644 build/cjpegli.1 "$pkgdir/usr/share/man/man1/cjpegli.1"
  install -Dm644 build/djpegli.1 "$pkgdir/usr/share/man/man1/djpegli.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
