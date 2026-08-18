# Maintainer: kekmacska <kekmacska2@proton.me>

pkgname=linwood-butterfly-git
pkgbase=linwood-butterfly-git
pkgver=2.6.0_beta.6_194_git9c63c4c9de
pkgrel=1
pkgdesc="Development build of Linwood Butterfly, a Flutter-based endless canvas note-taking app"
arch=('x86_64')
url="https://github.com/LinwoodDev/Butterfly"
license=('AGPL-3.0')
provides=('butterfly')
conflicts=('butterfly-bin')
options=('strip')

depends=(
  glibc
  gtk3
  at-spi2-core
  libsecret
)

makedepends=(
  git
  flutter
  svgo
  oxipng
)

source=('git+https://github.com/LinwoodDev/Butterfly.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Butterfly"
  local version
  version=$(grep '^version:' app/pubspec.yaml | cut -d ' ' -f2)

  # Escape illegal characters for pkgver
  version="${version//-/_}"
  version="${version//+/_}"

  printf "${version}_git$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/Butterfly"
  svgo . -r --multipass
  oxipng -o max -r -p -s -v -t 4 --timeout 150 ./app/{images,lib,linux,templates,test}
}

build() {
  cd "$srcdir/Butterfly"

  # Build Flutter release
  cd app
  flutter clean
  flutter pub get

    BASE_CFLAGS="-O3 -march=native -mtune=native \
    -falign-functions=32 -falign-loops=32 \
    -fno-math-errno -fno-trapping-math \
    -fno-semantic-interposition \
    -fomit-frame-pointer -fno-plt \
    -pipe -flto -Wall -Wno-unused \
    -fstrict-aliasing -fno-rtti  \
    -fmerge-all-constants -ffunction-sections \
    -fdata-sections"

  BASE_CXXFLAGS="$BASE_CFLAGS"

  BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

  CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
  CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
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
  local _src="$srcdir/Butterfly"
  local _bundle="$_src/app/build/linux/x64/release/bundle"
  local _libdir="/usr/lib/butterfly"
  local _bindir="/usr/bin"

  # Strip debug symbols
  strip "${_bundle}/butterfly" || true
  strip "${_bundle}/lib/"* || true

  # Create target directories
  install -dm755 "${pkgdir}${_libdir}"
  install -dm755 "${pkgdir}${_bindir}"

  # Copy entire bundle to libdir
  cp -a "${_bundle}/." "${pkgdir}${_libdir}/"

  # Symlink binary into /usr/bin
  ln -s "../lib/butterfly/butterfly" "${pkgdir}${_bindir}/butterfly"

  # Install icon
  install -Dm644 \
    "${_src}/app/build/flutter_assets/images/logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/butterfly.svg"

install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/butterfly.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Butterfly
Comment=Endless canvas note-taking app
Exec=butterfly
Icon=butterfly
Categories=Utility;
StartupNotify=true
EOF

chmod 644 "${pkgdir}/usr/share/applications/butterfly.desktop"
}
