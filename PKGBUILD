# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_friction_docs_commit=940076205a9226628d20bbf7bc333d9dcf1d749b
_friction_icon_theme_commit=c7f676e48db6bf43db3f9bb2e723b2526ca42d0d
_gperftools_commit=b97c293c812c7ec3cdeccd50a89769e746c01377
_skia_commit=f6e5f9e8dfa6d410d626a6c48882a2e1ab3db36a

pkgname=friction
pkgver=1.0.0_beta.2
_pkgver=${pkgver/_/-}
pkgrel=1
arch=('x86_64')
pkgdesc="Motion graphics and animation app"
url="https://friction.graphics/"
_url_github="https://github.com/friction2d"
license=('GPL-3.0-or-later')
depends=('ffmpeg4.4' 'qscintilla-qt5' 'qt5-declarative' 'qt5-multimedia')
makedepends=('clang' 'cmake' 'harfbuzz-icu' 'llvm' 'ninja' 'python' 'qt5-tools')
source=("$pkgname-$_pkgver.tar.gz::$_url_github/$pkgname/archive/refs/tags/v${_pkgver}.tar.gz"
        "friction-docs-$_friction_docs_commit.tar.gz::$_url_github/friction2d.github.io/archive/$_friction_docs_commit.tar.gz"
        "friction-icon-theme-$_friction_icon_theme_commit.tar.gz::$_url_github/friction-icon-theme/archive/$_friction_icon_theme_commit.tar.gz"
        "gperftools-$_gperftools_commit.tar.gz::$_url_github/gperftools/archive/$_gperftools_commit.tar.gz"
        "skia-$_skia_commit.tar.gz::$_url_github/skia/archive/$_skia_commit.tar.gz")
b2sums=('dda557424e093d0cce087942a6d5f3e28294918ac01a8563613b43b7b954a350c1c04b63b5d94e39939b8bb9a60f3d8c47bcf0296d8e99e341deff5a93530645'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  tar -xzf "friction-docs-$_friction_docs_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$_pkgver/docs"
  tar -xzf "friction-icon-theme-$_friction_icon_theme_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$_pkgver/src/app/icons"
  tar -xzf "gperftools-$_gperftools_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$_pkgver/src/gperftools"
  tar -xzf "skia-$_skia_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$_pkgver/src/engine/skia"

  # Disabling LTO in gperftools build
  # Required to create static library
  sed -i '/HOST string/ a set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-lto")\nset(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-lto")' \
         "$pkgname-$_pkgver/src/gperftools/CMakeLists.txt"
}

build() {
  cd $pkgname-$_pkgver
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
  cd $pkgname-$_pkgver
  DESTDIR="$pkgdir" ninja -C build/ install
}
