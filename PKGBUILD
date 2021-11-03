# Maintainer: Danil Doroshin <ddddanil5555 at gmail dot com>
pkgname=kwin-bismuth
pkgver=2.0.0
pkgrel=1
pkgdesc="KWin tiling extension, that gets you down to bismuth. Krohnkite fork"
arch=('x86_64')
url="https://github.com/gikari/bismuth"
license=('MIT')
depends=('hicolor-icon-theme' 'kdeclarative')
makedepends=('tar' 'unzip' 'cmake' 'ninja' 'esbuild')
source=("bismuth.v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cc38af4931ced60e8c215dbf3693ae0411396d4c9a3ea543f85b3a3598afb67e')

prepare() {
  tar xf $srcdir/bismuth.v$pkgver.tar.gz --directory=$srcdir
}

build() {
  (
    cd "$srcdir/bismuth-$pkgver/src/kwinscript"
    mkdir -p "build/contents/code"
    cp -r "./ui" "./build/contents"
    cp "./metadata.desktop" "./build/metadata.desktop"
    sed -i "s/\$VER/${npm_package_version:-1.0}/" "./build/metadata.desktop"
    esbuild \
      --bundle "./index.ts" \
      --outfile="./build/contents/code/index.mjs" \
      --format=esm \
      --platform=neutral
  )
  (
    cd "$srcdir/bismuth-$pkgver/src/kcm"
    mkdir -p "build"
    cmake -S "." -B "./build" -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    cmake --build "./build"
  )
}

package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp -r "$srcdir/bismuth-$pkgver/LICENSES/" "$pkgdir/usr/share/licenses/$pkgname/"
  mkdir -p "$pkgdir/usr/share/kwin/scripts/bismuth"
  install "$srcdir/bismuth-$pkgver/src/kwinscript/build/metadata.desktop" "$pkgdir/usr/share/kwin/scripts/bismuth/"
  cp -r "$srcdir/bismuth-$pkgver/src/kwinscript/build/contents" "$pkgdir/usr/share/kwin/scripts/bismuth/contents"
  mkdir -p "$pkgdir/usr/share/kservices5"
  install "$pkgdir/usr/share/kwin/scripts/bismuth/metadata.desktop" "$pkgdir/usr/share/kservices5/bismuth.desktop"
  DESTDIR="${pkgdir}" cmake --install "$srcdir/bismuth-$pkgver/src/kcm/build"
}

# vim:set ts=2 sw=2 et:
