# fconvert v2.2.0 (c) 2023 - 2026 Eraldo Bako - MIT License
# Maintainer: Eraldo Bako <eraldobako@gmail.com>
pkgname=fconvert
pkgver=2.2.0
pkgrel=2
pkgdesc="A fast, intentional CLI file converter for images, audio, video, documents."
arch=('x86_64')
url="https://github.com/Eraldo-Bako/fconvert"
license=('MIT')
depends=('opencv' 'ffmpeg' 'libraw' 'imagemagick' 'ghostscript')
makedepends=('gcc' 'cmake' 'git')
optdepends=(
  'pandoc: Essential for document conversion'
  'typst: Essential for pdf conversion'
  'libheif: Essential format codec for HEIC/HEIF asset conversion'
  'libde265: HEVC decoder support for HEIF image sequences'
  'x265: HEVC encoder support for HEIF image sequences'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  echo "fconvert==> Attempting compilation via CMake..."
  if cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_STRIP=ON -DWITH_LIBRAW=ON && cmake --build build; then
    echo "fconvert==> CMake build successful!"
    cp build/fconvert .
  else
    echo "fconvert==> WARNING: CMake build failed. Falling back to manual g++ compilation..."
    rm -rf build     
    g++ -std=c++17 -O3 -s main.cpp classes/*.cpp -o fconvert `pkg-config --cflags --libs opencv4 libraw`
  fi
}

package() {
  cd "$pkgname"
  install -Dm755 fconvert "$pkgdir/usr/bin/fconvert"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
