# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_friction_docs_commit=4f83f5ebd8456d3f2b8288a48a456aea0de54a5c
_friction_icon_theme_commit=3a37690907ee9e662e578f767bcc71eaf4d9d739
_gn_commit=70a9617aad7c09642457b6296d35638b97375dad
_gperftools_commit=b97c293c812c7ec3cdeccd50a89769e746c01377
_skia_commit=b551a388dfbe112f40b6f4fc710d25255c3969f5

pkgname=friction
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="Motion graphics and animation app"
url="https://friction.graphics/"
_url_github="https://github.com/friction2d"
license=('GPL-3.0-or-later')
depends=('ffmpeg4.4' 'qscintilla-qt5' 'qt5-declarative' 'qt5-multimedia')
makedepends=('clang' 'cmake' 'harfbuzz-icu' 'llvm' 'ninja' 'python' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::$_url_github/$pkgname/archive/refs/tags/v${pkgver}.tar.gz"
        "friction-docs-$_friction_docs_commit.tar.gz::$_url_github/friction2d.github.io/archive/$_friction_docs_commit.tar.gz"
        "friction-icon-theme-$_friction_icon_theme_commit.tar.gz::$_url_github/friction-icon-theme/archive/$_friction_icon_theme_commit.tar.gz"
        "gn-$_gn_commit.tar.gz::$_url_github/gn/archive/$_gn_commit.tar.gz"
        "gperftools-$_gperftools_commit.tar.gz::$_url_github/gperftools/archive/$_gperftools_commit.tar.gz"
        "skia-$_skia_commit.tar.gz::$_url_github/skia/archive/$_skia_commit.tar.gz")
b2sums=('5b68e687c0c7cc9d78258d0f9a7935b3778bbe015f16b6e5bd84f2f0e6d7770ee94915dbb68d42908bd8fb817b9e56afb6ab86572957247929bf75c1f9108fbf'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  tar -xzf "friction-docs-$_friction_docs_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/docs"
  tar -xzf "friction-icon-theme-$_friction_icon_theme_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/src/app/icons"
  tar -xzf "gperftools-$_gperftools_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/src/gperftools"
  tar -xzf "skia-$_skia_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/src/skia"
  tar -xzf "gn-$_gn_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$pkgver/src/skia/gn-src"

  # Disabling LTO in gperftools build
  # Required to create static library
  sed -i '/HOST string/ a set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-lto")\nset(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-lto")' \
         "$pkgname-$pkgver/src/gperftools/CMakeLists.txt"

  # Fix for Clang 19+ half-float conversion error
#  sed -i '/vcvtph2ps25/ s|return|//return|' \
#         "$pkgname-$pkgver/src/skia/third_party/skcms/src/Transform_inl.h"
#
}

build() {
  cd $pkgname-$pkgver
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_VERSION_MAJOR=5
  ninja -C build/
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build/ install
}
