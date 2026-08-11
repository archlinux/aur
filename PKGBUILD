# Maintainer: kekmacska
pkgname=svt-av1-tritium-git
pkgver=4.1.0.r54.gd4d06e127
pkgrel=1
pkgdesc="SVT-AV1-Tritium is a fork of SVT-AV1-HDR with PSYEX + Essential features"
arch=('x86_64')
url="https://github.com/Uranite/svt-av1-tritium"
license=('BSD-3-Clause-Clear')
depends=('libdovi' 'libhdr10plus-rs-git')
makedepends=('git' 'clang' 'ninja' 'cmake' 'nasm')
conflicts=(
  'svt-av1'
  'svt-av1-hdr-git'
  'svt-av1-essential-git'
  'svt-av1-psy-git'
  'svt-av1-psyex-git'
  'svt-av1-hdr10plus-git'
  'svt-av1-bluesword-git'
)
provides=('svt-av1' 'SvtAv1EncApp' 'libSvtAv1Enc.so')

source=(
  "$pkgname::git+$url"
  "SvtAv1Enc.pc"
)
sha256sums=('SKIP' '376182aad9bdae7e0f1df2f6248078626646cb9e4d30626a3571662502c32de7')

pkgver() {
  cd "$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  git fetch --all
  git reset --hard origin/main
}

build() {
  cd "$pkgname/Build/linux"

  # Safe optimizations for video encoders
  CFLAGS="-O3 -march=native -mtune=native \
        -funroll-loops \
        -falign-functions=32 -falign-loops=32 \
        -fomit-frame-pointer \
        -fno-math-errno -fno-trapping-math \
        -fno-semantic-interposition -fno-plt \
        -fstrict-aliasing -fstrict-enums \
        -fmerge-all-constants \
        -fno-exceptions -fno-rtti \
        -fno-unwind-tables -fno-asynchronous-unwind-tables \
        -fvectorize -fslp-vectorize \
        -fwhole-program-vtables \
        -flto \
        -Wall -pipe"
  export CXXFLAGS="$CFLAGS"
  export LDFLAGS="-flto -fno-plt -Wl,-O2 -Wl,--as-needed -Wl,-z,now"

  bash build.sh \
    --asm=nasm \
    --enable-dovi \
    --enable-hdr10plus \
    --enable-pgo \
    --shared \
    --native \
    --gen=Ninja \
    --jobs="$(nproc)" \
    --release
}

package() {
  cd "$pkgname"

  # Install binary
  install -Dm755 "Bin/Release/SvtAv1EncApp" "$pkgdir/usr/bin/SvtAv1EncApp"

  # Install shared libs
  for _lib in Bin/Release/*.so*; do
    install -Dm755 "$_lib" "$pkgdir/usr/lib/$(basename "$_lib")"
  done

  # Create ABI-safe symlink to silence ldconfig warning
  ln -s libSvtAv1Enc.so.4 "$pkgdir/usr/lib/libSvtAv1Enc.so"

  # Install headers (needed for FFmpeg)
  install -d "$pkgdir/usr/include/svt-av1"
  install -m644 Source/API/*.h "$pkgdir/usr/include/svt-av1/"

  # Install pkg-config file (critical for FFmpeg detection)
  install -Dm644 "$srcdir/SvtAv1Enc.pc" "$pkgdir/usr/lib/pkgconfig/SvtAv1Enc.pc"

  # License
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
