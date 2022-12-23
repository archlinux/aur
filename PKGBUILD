# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="bambustudio-git"
pkgver=01.04.00.17.35.ge32792c3
pkgrel=1
pkgdesc="PC Software for BambuLab's 3D printers"
arch=('x86_64')
url="https://github.com/bambulab/BambuStudio"
license=('AGPLv3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'harmonyos-sans-git')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'm4' 'pkgconf')
provides=("BambuStudio")
conflicts=("BambuStudio")
source=(
  'git+https://github.com/bambulab/BambuStudio.git'
  'BambuStudio.cpp.patch'
  'CMakeLists.txt.patch'
  'wxWidgets.cmake.patch'
  'bambu-studio.sh'
  )
sha512sums=('SKIP'
            '419e7ffb8044531a1c78cd191a96c11f719b439afce674f7e31d1d2e0dc57ecc03cea27ab4ad5ee6522606630fd59ac1745b9a1b787db14893561a4495806117'
            '04d46a8b3ffe459ff19e94a2545f1e7b2cca336d3a3688b7aefbafbfe341301009cf61b59c1901629bbc9919e0a5e0462fb3346d5b72d3264b03e9175fa54c5a'
            '4dea14df6ced2f6d0038b003f845057ef37e3be9de39f505d96bdeb3082b91aeb8fb349207554d2c7074f0f1a2b9c7285f59ecff7938ed164b57e486b43bf835'
            'e3cb1b072754ae6443fa136fffa263761b5e4e3da5dca1e91b7c4d577daaf01afa0affde04f1355fc404fcd336852db4ce8dc57938833f864346a0b17c12d6d6')

pkgver() {
  ln -sf BambuStudio "BambuStudio"
  cd "BambuStudio"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

prepare() {
  # fix broken udev install reference
  patch -p0 < "$srcdir/CMakeLists.txt.patch"
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
