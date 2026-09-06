# Maintainer: kekmacska
pkgname=svt-av1-tritium-git
pkgver=4.1.0.r69.g0f9d3f000
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
  CFLAGS="-O3 -march=znver4 -mtune=znver4 \
          -falign-functions=32 -falign-loops=32 \
          -fno-math-errno -fno-trapping-math \
          -fno-semantic-interposition \
          -fomit-frame-pointer -fno-plt \
          -pipe -flto -Wall -Wno-unused \
          -fstrict-aliasing -fno-rtti -fno-exceptions \
          -fstrict-vtable-pointers -fno-asynchronous-unwind-tables \
          -fmerge-all-constants -ffunction-sections \
          -fdata-sections"
  export CXXFLAGS="$CFLAGS"
  export LDFLAGS="-flto -fno-plt -Wl,-O3 -Wl,--as-needed -Wl,-z,now"

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
    install -Dm755 \
        "Bin/Release/SvtAv1EncApp" \
        "$pkgdir/usr/bin/SvtAv1EncApp"

    # Install shared libraries
    install -d "$pkgdir/usr/lib"
    cp -a Bin/Release/*.so* "$pkgdir/usr/lib/"

    # Install headers (needed for FFmpeg)
    install -d "$pkgdir/usr/include/svt-av1"
    install -m644 Source/API/*.h \
        "$pkgdir/usr/include/svt-av1/"

    # Install pkg-config file
    install -Dm644 \
        "$srcdir/SvtAv1Enc.pc" \
        "$pkgdir/usr/lib/pkgconfig/SvtAv1Enc.pc"

    # License
    install -Dm644 \
        LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
