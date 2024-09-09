pkgname=orca-slicer-git
pkgver=2.2.0.158c71f05e_beta
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('cairo' 'dbus' 'expat' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 
         'gst-plugins-bad-libs' 'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libglvnd' 'libjpeg-turbo' 
         'libspnav' 'libtiff' 'libx11' 'pango' 'python' 'wayland' 'webkit2gtk-4.1' 'zlib')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'glew' 'm4' 'ninja' 'pkgconf' 'wayland-protocols')
provides=("orca-slicer")
source=("$pkgname::git+https://github.com/SoftFever/OrcaSlicer.git")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  _version=$(sed -n 's/set(SoftFever_VERSION "\([^"]*\)-.*".*/\1/p' version.inc)
  _suffix=$(sed -n 's/set(SoftFever_VERSION ".*-\([^"]*\)".*/\1/p' version.inc)
  _commit=$(git rev-parse --short HEAD)
  printf "%s.%s_%s" $_version $_commit $_suffix
}

prepare() {
  cd $srcdir/$pkgname

  # C++20 disallows the use of the Point<T> syntax in the constructor
  sed -i 's/explicit Point<T>(/explicit Point(/' src/clipper2/Clipper2Lib/include/clipper2/clipper.core.h
}

build() {
  cd $srcdir/$pkgname
  export CXXFLAGS="${CXXFLAGS} -flto"
  
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
    -DCMAKE_INSTALL_FULL_DATAROOTDIR=/usr\/share/ \
    -DCMAKE_PREFIX_PATH=$srcdir/$pkgname/deps/build/destdir/usr/local \
    -DSLIC3R_STATIC=1 \
    -DORCA_TOOLS=1 \
    -DSLIC3R_FHS=1 \
    -DSLIC3R_GTK=3
  ninja -C build
}

package() {
  cd $srcdir/$pkgname
  
  DESTDIR=$pkgdir ninja -C build install
  install -Dm644 doc/*.md -t $pkgdir/usr/share/doc/OrcaSlicer/
  install -Dm644 $pkgdir/usr/LICENSE.txt $pkgdir/usr/share/licenses/OrcaSlicer/LICENSE
  rm -rf $pkgdir/usr/LICENSE.txt
}

