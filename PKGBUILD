# Maintainer: c2h5oh

pkgname="orca-slicer"
pkgver=2.4.2
pkgrel=2
epoch=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/OrcaSlicer/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('bash' 'cairo' 'dbus' 'expat' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gspell' 'gst-plugins-bad-libs'
         'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libjpeg-turbo' 'libstdc++' 'libx11' 'libxkbcommon'
         'mesa' 'mesa-utils' 'pango' 'python' 'wayland' 'webkit2gtk-4.1' 'zlib')
makedepends=('awk' 'ccache' 'cmake' 'extra-cmake-modules' 'git' 'glew' 'libigl' 'libmspack' 'libnotify' 'm4' 'ninja'
             'pkgconf' 'python-numpy' 'superlu' 'wayland-protocols')
optdepends=('nvidia-utils: for querying driver version')
options=('!debug' '!emptydirs')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("OrcaSlicer-v${pkgver}.tar.gz::https://codeload.github.com/OrcaSlicer/OrcaSlicer/tar.gz/refs/tags/v${pkgver}"
        "orca-slicer.sh")
sha256sums=('d97244baf15eb9377aa86714cb042d537ff3b1db13b7c2657cf865b820701cf0'
            'c1ca1fadba5f5c088af80f076f911c74fa594e8200cee7be65e4330f43909e7d')

build() {
  # cmake 4.x compatibility workaround
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cd "$srcdir/OrcaSlicer-${pkgver}"

  export CMAKE_BUILD_PARALLEL_LEVEL=$(nproc)
  # Limit build parallelism to free memory in GB
  if [ $CMAKE_BUILD_PARALLEL_LEVEL -gt $(awk '/MemAvailable/ { printf "%.0f\n", $2/1024/1024 }' /proc/meminfo) ]; then
    export CMAKE_BUILD_PARALLEL_LEVEL=$(awk '/MemAvailable/ { printf "%.0f\n", $2/1024/1024 }' /proc/meminfo)
  fi

  # deps
  cmake -S deps \
    -B deps/build \
    -G Ninja \
    -DDEP_WX_GTK3=ON \
    -DDESTDIR="$PWD/deps/build/destdir" \
    -DDEP_DOWNLOAD_DIR="$PWD/deps/DL_CACHE" \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build deps/build -j1

  cmake \
    -S . \
    -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_FULL_DATAROOTDIR=/usr/share/ \
    -DCMAKE_PREFIX_PATH="$PWD/deps/build/destdir/usr/local" \
    -DSLIC3R_STATIC=1 \
    -DORCA_TOOLS=1 \
    -DSLIC3R_FHS=1 \
    -DSLIC3R_GTK=3 \
    -DBBL_RELEASE_TO_PUBLIC=1 \
    -DBBL_INTERNAL_TESTING=0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCOLORED_OUTPUT=ON
  cmake --build build

  # add localizations
  ./scripts//run_gettext.sh --full
}

package() {
  cd "$srcdir/OrcaSlicer-${pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
  install -d "$pkgdir/usr/lib/OrcaSlicer/"
  mv "$pkgdir/usr/bin/orca-slicer" "$pkgdir/usr/lib/OrcaSlicer/"
  install -Dm755 ../orca-slicer.sh "$pkgdir/usr/bin/orca-slicer"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/OrcaSlicer/LICENSE"
  rm -rf "$pkgdir/usr/LICENSE.txt"
}

