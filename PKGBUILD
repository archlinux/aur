# Maintainer: kekmacska
pkgname=svt-av1-tritium-git
pkgver=4.1.0.r52.g1e33a0d12
pkgrel=1
pkgdesc="SVT-AV1-Tritium is a fork of SVT-AV1-HDR aiming to incorporate features from SVT-AV1-PSYEX and SVT-AV1-Essential."
arch=('x86_64')
url="https://github.com/Uranite/svt-av1-tritium"
license=('custom')
depends=('libdovi')
depends=('libhdr10plus-rs-git')
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
provides=('svt-av1' 'SvtAv1EncApp' 'SvtAv1EncApp.so')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  git fetch --all
  git reset --hard origin/main
  printf "MAKE SURE YOU INSTALLED 'libhdr10plus-rs-git' FROM THE AUR OR THE BUILD WILL FAIL!!!!!"
}

build() {
  cd "$pkgname/Build/linux"

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

  # Install binaries
  install -Dm755 "Bin/Release/SvtAv1EncApp" "$pkgdir/usr/bin/SvtAv1EncApp"

  # Install all shared libraries
  for _lib in Bin/Release/*.so*; do
    install -Dm755 "$_lib" "$pkgdir/usr/lib/$(basename "$_lib")"
  done

  # Install license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
