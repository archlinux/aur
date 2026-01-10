# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ensemble-chorus
pkgname=$_pkgname-git
pkgver=0.0.1.r56.59baeb8
pkgrel=3
pkgdesc='An LV2/VST2 plugin and stand-alone application emulating a string ensemble chorus'
arch=('i686' 'x86_64')
url='https://github.com/jpcima/ensemble-chorus'
license=(BSL-1.0)
depends=(alsa-lib gcc-libs glibc fltk freetype2 jack libpulse libx11 libxext)
makedepends=(git)
optdepends=(
  'lv2-host: for loading the LV2 plugin'
  'vst-host: for loading the VST2 plugin'
)
groups=(pro-audio lv2-plugins vst-plugins)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
    "$_pkgname::git+https://github.com/jpcima/$_pkgname.git"
    'git+https://github.com/vinniefalco/DSPFilters.git'
    'git+https://github.com/martinmoene/gsl-lite.git'
    'git+https://github.com/thestk/rtaudio.git'
    'git+https://github.com/boostorg/predef.git'
    'git+https://github.com/zeux/pugixml.git'
    'git+https://github.com/jpcima/JUCE.git'
    'juce-pixel.patch'
    'ensemble-chorus-missing-includes.patch'
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'a98866e03ccdebf93969755277c2712d'
         '8a972e8794e0c48b8ac0ef8afb584f10')


pkgver() {
  cd $srcdir/$_pkgname

  local ver=$(grep 'EnsembleChorus VERSION' CMakeLists.txt | cut -d '"' -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname

  for submodule in DSPFilters gsl-lite rtaudio predef pugixml JUCE; do
    git config submodule.thirdparty/${submodule}.url "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update

  patch -N -r - -p1 -i "$srcdir"/ensemble-chorus-missing-includes.patch
  
  # https://github.com/WeAreROLI/JUCE/commit/4e0adb2af8b424c43d22bd431011c9a6c57d36b6.patch
  ( cd thirdparty/JUCE; patch -N -r - -p1 -i "$srcdir"/juce-pixel.patch || exit 0; )
}

build() {
  cmake -B $_pkgname-build -S $_pkgname \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build $_pkgname-build
}

package() {
  depends+=(libasound.so libfltk.so libfreetype.so libjack.so libpulse-simple.so libpulse.so)
  DESTDIR="$pkgdir" cmake --install $_pkgname-build
}
