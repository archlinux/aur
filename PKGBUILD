# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=enve-git
_pkgname=${pkgname%-git}
pkgver=continuous.linux.r65.gc0062e63
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="2D animation software"
url="https://maurycyliebner.github.io/"
license=('GPL3')
depends=('ffmpeg4.4' 'gperftools' 'qt5-multimedia' 'qt5-svg' 'qt5-webengine' 'qscintilla-qt5' 'quazip')
makedepends=('git' 'gn' 'intltool' 'ninja' 'openmp' 'python')
source=("git+https://github.com/MaurycyLiebner/enve.git"
        "git+https://github.com/gperftools/gperftools.git"
        "git+https://github.com/mypaint/libmypaint.git"
        "git+https://skia.googlesource.com/skia.git"
        "enve-QPainterPath.patch"
        "enve-skia-deps-python3.patch")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a6ec4054ee0b91a02e99e8dcd0dab08afe0d72bb00065b9df3425081247be37da25635e7b9faf55039e380582c0a40a3ff73b79f29df0c7d6c7c45b8117c3ad6'
            '527906079ac8d14837acb78f750c60bee212976e2e335e58777db5e563b76f8288cc6f50259512e3fe2789b47e4101ed8e6c616ee193c6a547ecf13e89787907')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Git submodules
  cd $_pkgname
  git submodule init
  git config submodule.third_party/gperftools.url $srcdir/gperftools
  git config submodule.third_party/libmypaint.url $srcdir/libmypaint
  git config submodule.third_party/skia.url $srcdir/skia
  git submodule update

  # Patching enve source code
  patch --forward --strip=1 --input="$srcdir/enve-QPainterPath.patch"
  sed -i 's|libmypaint/||g' \
          src/core/libmypaintincludes.h

  # Change include directories
  sed -i 's|$$THIRD_PARTY_FOLDER/qscintilla/Qt4Qt5|/usr/include/qt|' \
          src/app/app.pro
  sed -i "s|\$\$THIRD_PARTY_FOLDER/quazip|$(pacman -Ql quazip | cut -d ' ' -f 2 | grep -i include\/quazip | head -1 | sed 's|\/$||')|" \
          src/core/core.pri
  sed -i "s|-L\$\$QUAZIP_FOLDER/.*|$(pacman -Ql quazip | cut -d ' ' -f 2 | grep -i lib\/*quazip | head -1)|" \
          src/core/core.pri

  cd third_party

  # Work around error "Dependency not allowed" during skia building
  # https://community.aseprite.org/t/skia-dependency-not-allowed-during-gn-gen/7091
  sed -i '/visibility/d' skia/BUILD.gn

  # Delete reference to gn function "set_sources_assignment_filter"
  # https://gn.googlesource.com/gn/+/55e535a6716e57320fdd3901f0347a5c30562199
  sed -i '/set_sources_assignment_filter/d' skia/BUILD.gn

  # Apply enve-specific library patches
  if [ ! -f gperftools/include/gperftools/heap-checker.h ]
  then
    make patch
  fi

  # Configure qmake to use FFmpeg 4.4 libraries
  sed -i '/Linux/ a\        LIBS += -L/usr/lib/ffmpeg4.4\n        INCLUDEPATH += /usr/include/ffmpeg4.4' \
         "$srcdir/$_pkgname/src/core/core.pri"
}

build() {
  # Build third party tools
  _third_party_dir="$srcdir/$_pkgname/third_party"

  # Build skia
  export PATH="$srcdir/.pkgbuild-bin":$PATH
  cd "$_third_party_dir/skia"
  python tools/git-sync-deps

  # Patch Skia dependencies to support Python 3
  if ! grep -q "b'clang" gn/is_clang.py
  then
    patch --forward --strip=3 --input="$srcdir/enve-skia-deps-python3.patch"
  fi

  gn gen out/Release --args='is_official_build=true is_debug=false extra_cflags=["-Wno-error"] skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_system_freetype2=false skia_use_system_harfbuzz=false'
  ninja -C out/Release skia

  # Build libmypaint (static)
  cd "$_third_party_dir/libmypaint"
  export CFLAGS='-fopenmp -Ofast -ftree-vectorize -fopt-info-vec-optimized -funsafe-math-optimizations -funsafe-loop-optimizations -fPIC'
  ./autogen.sh
  ./configure --enable-static --enable-openmp --enable-shared=false
  make
  unset CFLAGS

  # Build gperftools
  cd "$_third_party_dir/gperftools"
  ./autogen.sh
  ./configure --prefix=/usr LIBS=-lpthread
  make

  # Build enve
  cd "$srcdir/$_pkgname/build/Release"
  qmake ../../enve.pro \
        PREFIX=/usr \
        CONFIG+=release
  make
}

package() {
  cd "$srcdir/$_pkgname/build/Release"
  make INSTALL_ROOT="$pkgdir" install
}
