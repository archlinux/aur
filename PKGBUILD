# fconvert v2.4.0 | Copyright (c) 2023-2026 Eraldo Bako
# Licensed under the Apache License, Version 2.0 (the "License")
# Maintainer: eraldobako@gmail.com

pkgname=fconvert
pkgver=2.4.0
pkgrel=1
pkgdesc="A fast, intentional CLI file converter for images, audio, video, documents."
arch=('x86_64')
url="https://github.com/Eraldo-Bako/fconvert"
license=('Apache-2.0')
depends=('opencv' 'ffmpeg' 'libraw')
makedepends=('cmake' 'git')
optdepends=(
  'imagemagick: Needed for Vector-Based Conversion'
  'ghostscript: Necessary dependency for imagemagick'
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
    echo "[fconvert] ==> CMake build successful!"
  else
    echo "[fconvert] ==> WARNING: CMake build failed. Falling back to manual g++ compilation..."
    rm -rf build     
    g++ -std=c++17 -O3 -s main.cpp classes/*.cpp classes/program/*.cpp -o fconvert $(pkg-config --cflags --libs opencv4 libraw) $CXXFLAGS $LDFLAGS
  fi
}

package() {
  cd "$pkgname"
  if [ -f "build/fconvert" ]; then
      install -Dm755 build/fconvert "$pkgdir/usr/bin/fconvert"
  else
      install -Dm755 fconvert "$pkgdir/usr/bin/fconvert"
  fi

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [ -d "docs" ]; then
      mkdir -p "$pkgdir/usr/share/doc/$pkgname"
      cp -a docs/* "$pkgdir/usr/share/doc/$pkgname/"
    fi
}
