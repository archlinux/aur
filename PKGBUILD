# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_friction_docs_commit=55d538038c39a16af3d9625606c541fa5a23bd5b
_friction_icon_theme_commit=867bf64575aa2eb31fd837c6541be54d00e68c24
_gn_commit=70a9617aad7c09642457b6296d35638b97375dad
_gperftools_commit=b97c293c812c7ec3cdeccd50a89769e746c01377
_skia_commit=c30d2c4f604a9b65a98e847ba008ac6e1a936eda

pkgname=friction
pkgver=1.0.0_rc.3
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
        "gn-$_gn_commit.tar.gz::$_url_github/gn/archive/$_gn_commit.tar.gz"
        "gperftools-$_gperftools_commit.tar.gz::$_url_github/gperftools/archive/$_gperftools_commit.tar.gz"
        "skia-$_skia_commit.tar.gz::$_url_github/skia/archive/$_skia_commit.tar.gz")
b2sums=('178ffff866e6b03761a885026d374943e3a12666d077535d7640d6e5b59244087680d18a429ea0676bf0e67bb047fa423e0b14162b045fd120beeac20f108fa5'
        'SKIP'
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
      -C   "$pkgname-$_pkgver/src/skia"
  tar -xzf "gn-$_gn_commit.tar.gz" --strip 1 \
      -C   "$pkgname-$_pkgver/src/skia/gn-src"

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
