# Maintainer: c2h5oh

pkgname="orca-slicer"
pkgver=2.5.1
pkgrel=2
epoch=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/OrcaSlicer/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('bash' 'cairo' 'dbus' 'expat' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gspell' 'gst-plugins-bad-libs'
         'gstreamer' 'gtk3' 'hicolor-icon-theme' 'libdrm' 'libva' 'libgcc' 'libglvnd' 'libstdc++' 'libx11' 
         'libxkbcommon' 'mesa' 'mesa-utils' 'pango' 'python' 'python-matplotlib' 'python-numpy' 'python-shapely'
         'python-trimesh' 'wayland' 'webkit2gtk-4.1' 'zlib')
makedepends=('awk' 'ccache' 'cmake' 'extra-cmake-modules' 'git' 'glew' 'libigl' 'libmspack' 'libnotify' 'm4' 'nasm'
             'ninja' 'patchelf' 'pkgconf' 'python-numpy' 'superlu' 'wayland-protocols')
optdepends=('nvidia-utils: for querying driver version')
options=('!debug' '!emptydirs' '!lto')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("OrcaSlicer-v${pkgver}.tar.gz::https://codeload.github.com/OrcaSlicer/OrcaSlicer/tar.gz/refs/tags/v${pkgver}"
        "orca-slicer.sh"
        "ffmpeg.patch::https://patch-diff.githubusercontent.com/raw/OrcaSlicer/OrcaSlicer/pull/17523.patch"
        "boost.patch")
sha256sums=('7f04a53c7680816d2b54063dc4b88950607e5486240f2d0292919f8b6652cdb3'
            '9c492877cc058adee9a53e1626fb147327a683f9654a68747aacf0f62a73f271'
            '6b7c48550c12db4c20ad564c47a232eec0e069b9dc6c18b4e184139faf3a23ea'
            'd9a8148fa091d6ce2fae3f3eae9f7fa3169b0586d3dcc8cdbe4bcf1a2208aa13')


prepare() {
  cd "$srcdir/OrcaSlicer-${pkgver}"
  patch -Np1 -i "${srcdir}"/ffmpeg.patch
  patch -Np1 -i "${srcdir}"/boost.patch
  sed -i 's|CMAKE_INSTALL_PREFIX}/lib|CMAKE_INSTALL_PREFIX}/lib/OrcaSlicer|' CMakeLists.txt
}

build() {
  # cmake 4.x compatibility workaround
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cd "$srcdir/OrcaSlicer-${pkgver}"

  _jobs=$(nproc)
  if [[ $MAKEFLAGS =~ -j([0-9]+) ]]; then
    _jobs="${BASH_REMATCH[1]}"
  fi
  _mem=$(awk '/MemAvailable/ { printf "%.0f\n", $2 / 1024 / 1024 }' /proc/meminfo)
  if (( _jobs > _mem )); then
    _jobs=$_mem
  fi
  
  export CMAKE_BUILD_PARALLEL_LEVEL="$_jobs"

  # deps
  cmake -S deps \
    -B deps/build \
    -G Ninja \
    -DDEP_WX_GTK3=ON \
    -DDESTDIR="$PWD/deps/build/destdir" \
    -DDEP_DOWNLOAD_DIR="$PWD/deps/DL_CACHE"
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
  
  # bundle python runtime
  install -d "$pkgdir/usr/lib/OrcaSlicer/python"
  cp -a build/src/python/. "$pkgdir/usr/lib/OrcaSlicer/python/"
  rm -rf "$pkgdir/usr/lib/OrcaSlicer/python/pkgconfig" "$pkgdir/usr/lib/OrcaSlicer/python/python3.12/config-3.12-x86_64-linux-gnu"
  
  # Remove build-directory RUNPATHs from bundled Python libraries
  find "$pkgdir/usr/lib/OrcaSlicer/python" -type f \
    \( -name '*.so' -o -name '*.so.*' \) -print0 |
  while IFS= read -r -d '' file; do
      if readelf -d "$file" 2>/dev/null | grep -q '/build/orca-slicer'; then
          patchelf --remove-rpath "$file"
      fi
  done
  
  # Resolve OrcaSlicer's private libraries relative to its executable
  patchelf --set-rpath '$ORIGIN:$ORIGIN/python' "$pkgdir/usr/lib/OrcaSlicer/orca-slicer"
}

