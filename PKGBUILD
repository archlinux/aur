# Maintainer: lod <aur@cyber-anlage.de>

pkgname=orca-slicer-git
pkgver=2.5.0.r30479.f18eb21
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/OrcaSlicer/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('assimp' 'bash' 'cairo' 'curl' 'dbus' 'expat' 'draco' 'ffmpeg' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'glfw' 'gmp' 'gspell' 'gstreamer'
         'gst-plugins-bad-libs' 'gtk3' 'hicolor-icon-theme' 'icu' 'imath' 'libgcc' 'libpng' 'libglvnd' 'libjpeg-turbo'  'libspnav'
         'libstdc++' 'libx11' 'libxkbcommon' 'mesa' 'mesa-utils' 'mpfr' 'nlopt' 'onetbb' 'opencascade' 'opencv' 'openssl' 'openvdb'
         'pango' 'python' 'wayland' 'webkit2gtk-4.1' 'zlib' 'libnoise')
makedepends=('ccache' 'cereal' 'cgal' 'cmake' 'eigen' 'extra-cmake-modules' 'git' 'glew' 'libigl' 'libmspack' 'm4' 'ninja'
             'opencsg' 'pkgconf' 'python-numpy' 'superlu' 'uv' 'wayland-protocols')
optdepends=('nvidia-utils: for querying driver version')
options=('!debug' '!emptydirs')
provides=('orca-slicer')
conflicts=('orca-slicer')
source=($pkgname::git+https://github.com/OrcaSlicer/OrcaSlicer.git
        orca-slicer-wrapper.sh
        fixes_boost.patch
        fixes_cgal.patch
        fixes_igl.patch
        fixes_libnoise.patch
        fixes_occt.patch
        fixes_opencv.patch
        fixes_python.patch
        remove_bundled_libs_from_CMakeLists.patch)
b2sums=('SKIP'
        '25eb7be624db4074fc5840a6904187f9bbf3f8ed96b14430f7fdc8bcc9ebb0ce9ad033fbe1fde51a905baf8f87693ebc33b4c82a9200f561e7b593e5bffab02f'
        '12a27356e6bc1e85070cf3a4da5ade557e69bfeb2d0ab0e4caeda438671331406e9e4157256c7ff55c8844091772762cd219dfb34e207e5c985381439e691af4'
        '26631ec9426eee4dc1367f59684b0dc7ced73b1d269e299df94dd2f81c04a0d2e804af86ec2d660256e3d8536bdea91400429ab9c708a150abdb3315850268f6'
        'd6837b59b4e209eac9042644d5ed55cf63080e4662e3314b9fc21e9cf8484f2a86ee52690547c51f09935aecb8aab370939dc6d15ab7b50c871a3a17bfe66ebb'
        '0c65b83acd74496f531aa064179aa40ee61feea2d73012ca38b7d6acd0ccd973978a639a9ddb75f8a9e512ebbc7c86caa5d501c15bf77cb121a8ef40d1f405ad'
        '996435df556705192dccb35b011f4c27de798cac9b5c684679a13c20cbda02aa24680f2eddb34f820cf99c1f5dfc70333083fac92cb2c97dd65f8606a2119d25'
        '749e1ba78594c95140b2bc5e08f5b9962845f99b10bc7f0136ebf812b2bd3f0d83774031ead017aca4a913b8422171ff67c48897077014078f6187e11f0da0b3'
        '09c87046657ff620d213152ef77b0bc8a21bda8ddfe154aacaa0611ce6424e51132899c1a058f7cfe84f528ce9e7d7c20b04d0c35bb19460c4e82d4ad625fc63'
        'ce62d9648e8ef69f0506c4d5b7260d8d5b44b94e783c2a0a0f154ca73e904e8758bb009f6a85dea95b5930a2ebca538edcf2d9fcf61e015a905ad262d211fd69')

pkgver() {
  cd $pkgname
  _version=$(sed -n 's/set(SoftFever_VERSION "\([^"]*\)-.*".*/\1/p' version.inc)
  _revision=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.%s" $_version $_revision $_commit
}

prepare() {
  cd $pkgname

  # list of bundled packages to drop
  for _pkg in Assimp Blosc Boost Cereal CGAL CURL Draco Eigen EXPAT FFMPEG FREETYPE GLFW GLEW GMP JPEG libnoise MPFR NLopt OCCT OpenCSG OpenCV OpenEXR OpenSSL OpenVDB PNG python3 Qhull TBB ZLIB; do
    sed -i -e "s/dep_${_pkg}/\"\"/" -e "s|include(${_pkg}/${_pkg}.cmake)||" deps/CMakeLists.txt
  done

  # revert: Link libspnav statically (#9964)
  #git revert --no-commit 6ed9b0817381042a63fa121c5f9b5cbcb11a3bfa 
  git cherry-pick -n 9b7afcc6a4d1540d04deedbd5bd5d92dd8cf7487

  patch -Np1 -i "${srcdir}"/fixes_occt.patch
  patch -Np1 -i "${srcdir}"/fixes_opencv.patch
  patch -Np1 -i "${srcdir}"/fixes_libnoise.patch
  patch -Np1 -i "${srcdir}"/fixes_igl.patch
  patch -Np1 -i "${srcdir}"/fixes_cgal.patch
  patch -Np1 -i "${srcdir}"/fixes_boost.patch
  patch -Np1 -i "${srcdir}"/fixes_python.patch
  patch -Np1 -i "${srcdir}"/remove_bundled_libs_from_CMakeLists.patch  # UV libav/ffmpeg
}

build() {
  cd $pkgname
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  _jobs=$(nproc)
  if [[ $MAKEFLAGS =~ -j([0-9]+) ]]; then
    _jobs="${BASH_REMATCH[1]}"
  fi
  _mem=$(awk '/MemAvailable/ { printf "%.0f\n", $2 / 1024 / 1024 }' /proc/meminfo)
  if (( _jobs > _mem )); then
    _jobs=$_mem
  fi

  export CMAKE_BUILD_PARALLEL_LEVEL="$_jobs"
  export CXXFLAGS="$CXXFLAGS -I${srcdir}/orca-slicer-git/deps/build/destdir/usr/local/include"
  cmake \
    -G Ninja \
    -S deps \
    -B deps/build \
    -DDESTDIR="$PWD/deps/build/destdir" \
    -DDEP_DOWNLOAD_DIR="$PWD/deps/DL_CACHE" \
    -DDEP_WX_GTK3=ON
  ninja -C deps/build -j1

  cmake \
    -G Ninja \
    -S . \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_FULL_DATAROOTDIR=/usr/share/ \
    -DCMAKE_PREFIX_PATH="$PWD/deps/build/destdir/usr/local" \
    -Dlibigl_DIR=/usr/lib/cmake/igl \
    -DEigen3_DIR=/usr/lib/cmake/eigen3 \
    -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB \
    -DOpenVDB_openvdb_LIBRARY=/usr/lib/libopenvdb.so \
    -DOpenVDB_INCLUDE_DIR=/usr/include \
    -DSLIC3R_STATIC=1 \
    -DORCA_TOOLS=1 \
    -DSLIC3R_FHS=1 \
    -DSLIC3R_GTK=3
  ninja -C build -j"$_jobs"

  # add localizations
  ./scripts/run_gettext.sh --full
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja -C build install
  install -d "$pkgdir/usr/lib/OrcaSlicer/"
  mv "$pkgdir/usr/bin/orca-slicer" "$pkgdir/usr/lib/OrcaSlicer/"
  install -Dm755 ../orca-slicer-wrapper.sh "$pkgdir/usr/bin/orca-slicer"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/OrcaSlicer/LICENSE"
  rm -rf "$pkgdir/usr/LICENSE.txt"
}
