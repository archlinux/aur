# Maintainer: lod <aur@cyber-anlage.de>

pkgname=orca-slicer-git
pkgver=2.3.1.r24828.933b282
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libglvnd' 'libjpeg-turbo' 
         'libspnav' 'libtiff' 'libx11' 'pango' 'python' 'wayland' 'webkit2gtk-4.1' 'zlib')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'glew' 'libigl' 'm4' 'ninja' 'pkgconf' 'wayland-protocols')
options=('!debug' '!emptydirs')
provides=("orca-slicer")
source=("$pkgname::git+https://github.com/SoftFever/OrcaSlicer.git"
        "https://github.com/Open-Cascade-SAS/OCCT/commit/7236e83dcc1e7284e66dc61e612154617ef715d6.patch"
        "cmake=min-version.patch"
        "wxWidgets-cmake-min-version.patch")
b2sums=('SKIP'
        'cc7791841533e07787a4921b688fdd885782a67320936d445ad04102a68e8e044b5bf52a58d987d158ae522ae4f02a56a3525ccfd1831ef6a3b6459be14bd408'
        '562dcd07530faef0d9fdddf1e009075f67105c8239e4b1402cd890f7a89be8b11671dd6ecc7b55a155f2d05247070bb0b8ff84f2170ce2454ab818018be80e48'
        '1459ce126dd80a891006d2c40a001e75dc146ac9eb6ad8e975a3e4672ebb914baabecd8a4048742fab03e2820242f614449dd23a8e721bd5c945c8765e986a5a')


pkgver() {
  cd $pkgname
  _version=$(sed -n 's/set(SoftFever_VERSION "\([^"]*\)-.*".*/\1/p' version.inc)
  _revision=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.%s" $_version $_revision $_commit
}

prepare() {
  # C++20 disallows the use of the Point<T> syntax in the constructor
  sed -i 's/explicit Point<T>(/explicit Point(/' $pkgname/src/clipper2/Clipper2Lib/include/clipper2/clipper.core.h
  # abuse FLATPAK IF statement to build against some system libs
  sed -i 's/if(FLATPAK)/if(true)/' $pkgname/deps/CMakeLists.txt
  # cherry pick an OCCT commit to make it build with system freetype
  cat 7236e83dcc1e7284e66dc61e612154617ef715d6.patch >>  $pkgname/deps/OCCT/0001-OCCT-fix.patch
  # Fix xgettext: case-sensitive mismatches
  sed -i 's|src/slic3r/GUI/AMSMappingPopup.cpp|src/slic3r/GUI/AmsMappingPopup.cpp|g' $pkgname/localization/i18n/list.txt
  # Set cmake_minimum_required to 3.5 for all dependencies
  cp wxWidgets-cmake-min-version.patch $pkgname/deps/wxWidgets/wxWidgets-cmake-min-version.patch
  cd $pkgname
  git apply ../cmake=min-version.patch
  

  
}

build() {
  cd $pkgname
  export CXXFLAGS="${CXXFLAGS} -flto"
  
  cmake \
    -G Ninja \
    -S deps \
    -B deps/build \
    -DDEP_WX_GTK3=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  ninja -C deps/build

  cmake \
    -G Ninja \
    -S . \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_FULL_DATAROOTDIR=/usr/share/ \
    -DCMAKE_PREFIX_PATH="$srcdir/$pkgname/deps/build/destdir/usr/local" \
    -DSLIC3R_STATIC=1 \
    -DORCA_TOOLS=1 \
    -DSLIC3R_FHS=1 \
    -DSLIC3R_GTK=3 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  ninja -C build
  
  # add localizations
  ./run_gettext.sh --full
}

package() {
  cd $pkgname
  
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 doc/*.md -t "$pkgdir/usr/share/doc/OrcaSlicer/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/OrcaSlicer/LICENSE"
  rm -rf "$pkgdir/usr/LICENSE.txt"
}

