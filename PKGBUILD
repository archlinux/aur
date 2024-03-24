# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="bambustudio"
pkgver=01.08.04.51
pkgrel=1
pkgdesc="PC Software for BambuLab's 3D printers"
arch=('x86_64')
url="https://github.com/bambulab/BambuStudio"
license=('AGPLv3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'ttf-harmonyos-sans')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'm4' 'pkgconf')
provides=("BambuStudio")
conflicts=("BambuStudio")
source=(
  "https://github.com/bambulab/BambuStudio/archive/refs/tags/v${pkgver}.tar.gz"
  'bambu-studio.sh'
  'TBB.cmake'
  'OpenEXR.cmake'
  )
sha512sums=('9e09544c406b7b7b2e124262b4940d59ec3ecd3ddd0a7dac3255077338762729f825e5a2d7d890239e3054667295867c985d75fdc213f9c0be3a522a887f75e5'
            'e3cb1b072754ae6443fa136fffa263761b5e4e3da5dca1e91b7c4d577daaf01afa0affde04f1355fc404fcd336852db4ce8dc57938833f864346a0b17c12d6d6'
            '208a24cd44521907a261a5fa0a646eb469099bbe1b96805070e09cc1f288d7b8ff7d79dfd153e08f1ce5894030f87e5d89f33cfadfab8f2454f07d5495d360f1'
            'fcc49f8364b9446b34e0b96c72e5e4ff0288d2ebbdef8f38f8a488f97558133d0c826de1b7181e1484135e6a9e3b549b6c5fd66d37d8f3b13751b03a675d4e41')

prepare() {
  # link up directory
  ln -sf BambuStudio-${pkgver} BambuStudio
  # add missing 0001-Boost-fix.patch
#  cp 0001-Boost-fix.patch BambuStudio/deps/Boost
  # deal with GCC13 issues
#  cp 0001-OpenEXR-GCC13.patch BambuStudio/deps/OpenEXR/0001-OpenEXR-GCC13.patch
#  cp OpenEXR.cmake BambuStudio/deps/OpenEXR/OpenEXR.cmake
#  cp clipper.engine.h BambuStudio/src/clipper2/Clipper2Lib/include/clipper2/clipper.engine.h
#  cp clipper.engine.cpp BambuStudio/src/clipper2/Clipper2Lib/src/clipper.engine.cpp
}

build() {
  # deps
  cd "$srcdir/BambuStudio/deps"
  for dir in build deps; do
    test -d $dir || mkdir $dir
  done
  cd build
  if [ ! -f $srcdir/.deps_done ]; then
    cmake ../ -DDESTDIR="$srcdir/dep_linux" -DCMAKE_BUILD_TYPE=Release -DDEP_WX_GTK3=1
    { test "$(nproc)" -gt 1 && make -j"$(nproc)" ;} || make
  fi
  touch $srcdir/.deps_done

  # bins
  cd "$srcdir/BambuStudio"
  for dir in build install_dir; do
    test -d $dir || mkdir $dir
  done
  cd build
  cmake .. -DSLIC3R_FHS=1 -DSLIC3R_STATIC=ON -DSLIC3R_GTK=3 -DBBL_RELEASE_TO_PUBLIC=1 -DCMAKE_PREFIX_PATH="$srcdir/dep_linux/usr/local" -DCMAKE_INSTALL_PREFIX="$srcdir/install_dir" -DCMAKE_BUILD_TYPE=Release
#  cmake .. -DSLIC3R_STATIC=ON -DSLIC3R_GTK=3 -DBBL_RELEASE_TO_PUBLIC=1 -DCMAKE_PREFIX_PATH="$srcdir/dep_linux/usr/local" -DCMAKE_INSTALL_PREFIX="$srcdir/install_dir" -DCMAKE_BUILD_TYPE=Release
  { test "$(nproc)" -gt 1 && cmake --build . --target install --config Release -j"$(nproc)" ;} || cmake --build . --target install --config Release
}

package() {
  echo "Entering directory $srcdir/install_dir/bin."
  install -d "$pkgdir/usr/bin"
  cd "$srcdir/install_dir/bin"
  install "bambu-studio" "$pkgdir/usr/bin/bambu-studio-bin"
  install "$srcdir/bambu-studio.sh" "$pkgdir/usr/bin/bambu-studio"

  echo "Entering directory $srcdir/BambuStudio/install_dir."
  cd "$srcdir/install_dir"
  find share -type f -exec install -D {} "$pkgdir/usr/{}" \;

  echo "Entering directory $srcdir/BambuStudio/doc."
  cd "$srcdir/BambuStudio/doc"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
