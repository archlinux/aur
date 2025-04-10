# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_friction_docs_commit=bfb094ceaa262da12dac8122249ba35040bcdb2a
_friction_icon_theme_commit=d48d33af3dbdc90f84c038575f556f747558eab2
_gperftools_commit=b97c293c812c7ec3cdeccd50a89769e746c01377
_skia_commit=835261b1bd114f9047ccb95025466028cd8880b1

pkgname=friction
pkgver=1.0.0_rc.1
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
b2sums=('4879707a2269c2c05f486d2f953303904f6585a340b75058b7c5c83d91d3c283e62f2e62bffb91d0a551539683f4ec7fbbc5cf8f0e7bbaa99efb8715df187e36'
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
