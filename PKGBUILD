# fconvert v2.3.0 | Copyright (c) 2023-2026 Eraldo Bako
# Licensed under the Apache License, Version 2.0 (the "License")
# Maintainer: eraldobako@gmail.com

pkgname=fconvert
pkgver=2.3.0
pkgrel=1
pkgdesc="A fast, intentional CLI file converter for images, audio, video, documents."
arch=('x86_64')
url="https://github.com/Eraldo-Bako/fconvert"
license=('Apache')
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
  rm -rf build
  if cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWITH_LIBRAW=ON && cmake --build build; then
    echo "fconvert==> CMake build successful!"
    cp build/fconvert .
  else
    echo "fconvert==> WARNING: CMake build failed. Falling back to manual g++ compilation..."
    rm -rf build     
    g++ -std=c++17 -O3 -s main.cpp classes/*.cpp classes/program/*.cpp -o fconvert $(pkg-config --cflags --libs opencv4 libraw) $CXXFLAGS $LDFLAGS
  fi
}

package() {
  cd "$pkgname"
  install -Dm755 fconvert "$pkgdir/usr/bin/fconvert"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

