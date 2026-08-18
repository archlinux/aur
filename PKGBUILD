# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=saber-git
pkgver=1.35.1+1.r20.gg0a19d582
pkgrel=1
pkgdesc="Saber Notes – A Flutter-based desktop note-taking app"
arch=('x86_64')
url="https://github.com/saber-notes/saber"
license=('GPL-3.0')
depends=(
  'gtk3' 'libx11' 'libxcomposite' 'libxrandr' 'libxdamage' 'libxext' 'libxfixes'
  'glib2' 'pango' 'cairo' 'fontconfig' 'freetype2' 'wmctrl' 'webkit2gtk-4.1' 'libjxl'
)
makedepends=(
  'git' 'flutter' 'svgo' 'oxipng'
)
provides=('saber')
conflicts=('saber')
conflicts=('saber-bin')
source=("git+https://github.com/saber-notes/saber.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/saber"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/.g/'
}

prepare() {
    cd "$srcdir/saber"

    svgo . -r --multipass
    oxipng -o max -r -p -s -v -t $(nproc) -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 ./{.github,assets,assets_raw,lib,linux,packages,submodules,test}

    sed -i 's|^Icon=.*|Icon=saber|' flatpak/com.adilhanney.saber.desktop
}

build() {
  cd "$srcdir/saber"
  sh patches/pre/remove_proprietary_dependencies.sh

  BASE_CFLAGS="-O3 -march=native -mtune=native \
    -falign-functions=32 -falign-loops=32 \
    -fno-math-errno -fno-trapping-math \
    -fno-semantic-interposition \
    -fomit-frame-pointer -fno-plt \
    -pipe -flto -Wall -Wno-unused \
    -fstrict-aliasing \
    -fmerge-all-constants -ffunction-sections \
    -fdata-sections"

  BASE_CXXFLAGS="$BASE_CFLAGS"

  BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

  CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
  CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS -fno-rtti"
  CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

  if command -v clang >/dev/null 2>&1; then
      CC=clang
      CXX=clang++
      CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
      CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
      LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
  else
      CC=gcc
      CXX=g++
      CFLAGS="$BASE_CFLAGS"
      CXXFLAGS="$BASE_CXXFLAGS"
      LDFLAGS="$BASE_LDFLAGS"
  fi

  flutter build linux --release \
    -DCMAKE_C_COMPILER="$CC" \
    -DCMAKE_CXX_COMPILER="$CXX" \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS"
}

package() {
  local _libdir="/usr/lib/saber"
  local _bindir="/usr/bin"
  local _bundle="$srcdir/saber/build/linux/x64/release/bundle"

  strip "$_bundle/saber" || true
  strip "$_bundle/lib/"* || true

  install -dm755 "$pkgdir$_libdir"
  install -dm755 "$pkgdir$_bindir"

  cp -a "$_bundle/." "$pkgdir$_libdir/"

  ln -s "../lib/saber/saber" "$pkgdir$_bindir/saber"

  sed -i 's|^Icon=.*|Icon=saber|' "$srcdir/saber/flatpak/com.adilhanney.saber.desktop"

  install -Dm644 "$srcdir/saber/flatpak/com.adilhanney.saber.desktop" \
    "$pkgdir/usr/share/applications/saber.desktop"

  install -Dm644 "$_bundle/data/flutter_assets/assets/icon/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/saber.svg"
}
