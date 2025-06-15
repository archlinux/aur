# Maintainer: lod <aur@cyber-anlage.de>

pkgname=orca-slicer-git
pkgver=2.3.1.r25127.e13ec78
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('bash' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libglvnd' 'libjpeg-turbo' 
         'libspnav' 'libx11' 'pango' 'python' 'wayland' 'webkit2gtk-4.1' 'zlib')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'glew' 'libigl' 'm4' 'ninja' 'pkgconf' 'wayland-protocols')
optdepends=('mesa: Enables Zink fallback workaround for NVIDIA on Wayland'
            'mesa-utils: for detecting renderer'
            'nvidia-utils: for querying driver version')
options=('!debug' '!emptydirs')
provides=('orca-slicer')
conflicts=('orca-slicer')
source=($pkgname::git+https://github.com/SoftFever/OrcaSlicer.git
        orca-slicer-wrapper.sh)
b2sums=('SKIP'
        'ea635f7745795d535ddf8cf317b27986ae28c177ea3fd7764c3314f9ca152672d17af22541cd9f6efc08a04fd02b2bda502f867fd2dd6888c58cf9b5d7c6c2a4')

pkgver() {
  cd $pkgname
  _version=$(sed -n 's/set(SoftFever_VERSION "\([^"]*\)-.*".*/\1/p' version.inc)
  _revision=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.%s" $_version $_revision $_commit
}

prepare() {
  cd $pkgname
  # C++20 disallows the use of the Point<T> syntax in the constructor
  sed -i 's/explicit Point<T>(/explicit Point(/' src/clipper2/Clipper2Lib/include/clipper2/clipper.core.h
  # abuse FLATPAK IF statement to build against some system libs
  sed -i 's/if(FLATPAK)/if(true)/' deps/CMakeLists.txt
}

build() {
  cd $pkgname
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  
  cmake \
    -G Ninja \
    -S deps \
    -B deps/build \
    -DDEP_WX_GTK3=ON
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
    -DSLIC3R_GTK=3
  ninja -C build
  
  # add localizations
  ./run_gettext.sh --full
}

package() {
  cd $pkgname
  
  DESTDIR="$pkgdir" ninja -C build install
  install -d "$pkgdir/usr/lib/OrcaSlicer/"
  mv "$pkgdir/usr/bin/orca-slicer" "$pkgdir/usr/lib/OrcaSlicer/"
  install -Dm755 "$srcdir/orca-slicer-wrapper.sh" "$pkgdir/usr/bin/orca-slicer"
  install -Dm644 doc/*.md -t "$pkgdir/usr/share/doc/OrcaSlicer/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/OrcaSlicer/LICENSE"
  rm -rf "$pkgdir/usr/LICENSE.txt"
}
