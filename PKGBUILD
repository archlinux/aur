# Maintainer: lod <aur@cyber-anlage.de>

pkgname=orca-slicer-git
pkgver=2.3.1.r25470.266bfeb
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('bash' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libglvnd' 'libjpeg-turbo' 'libpng'
         'libspnav' 'libx11' 'pango' 'python' 'ttf-nanum' 'wayland' 'webkit2gtk-4.1' 'zlib' 'zstd')
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
        'f32c48ed4bdb353c4408aa17fff76fa2bc5988f2b681be2c6f61fb3520cbb4d783649f39bc0f354bc99b127a31e5ee3b1c1a8fc7352a35fb651e0e336dd0ddb5')

pkgver() {
  cd $pkgname
  _version=$(sed -n 's/set(SoftFever_VERSION "\([^"]*\)-.*".*/\1/p' version.inc)
  _revision=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.%s" $_version $_revision $_commit
}

prepare() {
  cd $pkgname

  # abuse FLATPAK IF statement to build against some system libs
  sed -i 's/if(FLATPAK)/if(true)/' deps/CMakeLists.txt
  # revert: Link libspnav statically (#9964)
  git revert --no-commit 6ed9b0817381042a63fa121c5f9b5cbcb11a3bfa 
}

build() {
  cd $pkgname
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  
  cmake \
    -G Ninja \
    -S deps \
    -B deps/build \
    -DDESTDIR="$PWD/deps/build/destdir" \
    -DDEP_DOWNLOAD_DIR="$PWD/deps/DL_CACHE" \
    -DCOLORED_OUTPUT=ON \
    -DDEP_WX_GTK3=ON
  ninja -C deps/build

  cmake \
    -G Ninja \
    -S . \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_FULL_DATAROOTDIR=/usr/share/ \
    -DCMAKE_PREFIX_PATH="$PWD/deps/build/destdir/usr/local" \
    -DSLIC3R_STATIC=1 \
    -DORCA_TOOLS=1 \
    -DSLIC3R_FHS=1 \
    -DSLIC3R_GTK=3
  ninja -C build
  
  # add localizations
  ./scripts//run_gettext.sh --full
}

package() {
  cd $pkgname
  
  DESTDIR="$pkgdir" ninja -C build install
  install -d "$pkgdir/usr/lib/OrcaSlicer/"
  mv "$pkgdir/usr/bin/orca-slicer" "$pkgdir/usr/lib/OrcaSlicer/"
  install -Dm755 ../orca-slicer-wrapper.sh "$pkgdir/usr/bin/orca-slicer"
  install -Dm644 doc/*.md -t "$pkgdir/usr/share/doc/OrcaSlicer/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/OrcaSlicer/LICENSE"
  rm -rf "$pkgdir/usr/LICENSE.txt"
}
