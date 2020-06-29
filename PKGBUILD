# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=enve-git
_pkgname=enve
pkgver=continuous.windows.r175.gf691b357
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="2D animation software"
url="https://maurycyliebner.github.io/"
license=('GPL3')
depends=('ffmpeg' 'gperftools' 'qscintilla-qt5' 'qt5-declarative' 'qt5-multimedia' 'qt5-svg' 'qt5-webengine' 'quazip')
makedepends=('git' 'gn' 'intltool' 'ninja' 'openmp')
source=("git+https://github.com/MaurycyLiebner/enve.git"
        "git+https://github.com/gperftools/gperftools.git"
        "git+https://github.com/mypaint/libmypaint.git"
        "git+https://skia.googlesource.com/skia.git"
        "enve-QPainterPath.patch"
        "enve-quazip-qscintilla.patch")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a6ec4054ee0b91a02e99e8dcd0dab08afe0d72bb00065b9df3425081247be37da25635e7b9faf55039e380582c0a40a3ff73b79f29df0c7d6c7c45b8117c3ad6'
            'ba321de43cf07aaf009d4f05e5962b9de578d65be8b8b58fed5c4f4b85d3ce0121715816263c3848d5c164906370cac35cbffbaee2472c188d54c44b3ed3db5a')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
# Git submodules
  cd $_pkgname
  git submodule init
  git config submodule.third_party/gperftools.url $srcdir/gperftools
  git config submodule.third_party/libmypaint.url $srcdir/libmypaint
  git config submodule.third_party/skia.url $srcdir/skia
  git submodule update

  # Creating a symbolic link to the python2 executable, used to build skia.
  # Source: aseprite-git PKGBUILD
  mkdir -p "$srcdir/.pkgbuild-bin"
  ln -sf "$(which python2)" "$srcdir/.pkgbuild-bin/python"

  # Patching enve source code
  patch --forward --strip=1 --input="$srcdir/enve-QPainterPath.patch"
  patch --forward --strip=1 --input="$srcdir/enve-quazip-qscintilla.patch"

  # Apply enve-specific library patches
  cd "$srcdir/$_pkgname/third_party"
  if ! patch --dry-run --silent --reverse -d gperftools -p1 < gperftools-enve-mod.patch 2>&- ;
  then
    make patch
  fi
}

build() {
  # Build third party tools
  _third_party_dir="$srcdir/$_pkgname/third_party"

  # Build skia
  export PATH="$srcdir/.pkgbuild-bin":$PATH
  cd "$_third_party_dir/skia"
  python tools/git-sync-deps
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
  ./configure --prefix=/usr
  make

  # Build enve
  cd "$srcdir/$_pkgname/build/Release"
  qmake ../../enve.pro \
        PREFIX=/usr \
        CONFIG+=release \
        CONFIG+=build_examples
  make
}

package() {
  cd "$srcdir/$_pkgname/build/Release"
  make INSTALL_ROOT="$pkgdir" install

  # Move libraries ignored by the "make install" script
  for file in 'Blur' 'Linearize' 'Shadow'; do
    find "$srcdir/$_pkgname/build/Release/examples" \
         -type f -name "libe${file}.so*" \
         -exec mv {} "$pkgdir/usr/lib" \;
  done
}
