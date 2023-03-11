# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="bambustudio"
pkgver=01.05.00.60
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
  "https://github.com/bambulab/BambuStudio/archive/refs/tags/v${pkgver}.tar.gz"
  'https://raw.githubusercontent.com/bambulab/BambuStudio/master/deps/Boost/0001-Boost-fix.patch'
  'BambuStudio.cpp.patch'
  'TreeSupport.cpp.patch'
  'CMakeLists.txt.patch'
  'bambu-studio.sh'
  )
sha512sums=('609bf2bb4ad5e66a12c9c7922137f3ba12ad2b49fc72426780c4209b2439d7feb99b0a973bbbdade826306569560c7ecaacc82825fee39a5a535371ced71ff91'
            'fd0c5df8bd82ad8fb96204921a407a4497406bc0d0b13ab11d241d28b6b924baf1d9557974506a8135f6c58ba0b183c6828a63b8b625edc1654484b3630af775'
            '419e7ffb8044531a1c78cd191a96c11f719b439afce674f7e31d1d2e0dc57ecc03cea27ab4ad5ee6522606630fd59ac1745b9a1b787db14893561a4495806117'
            '674fc00a73b2e5997e5f3dcf74299a2ab5dfac5114247f8b6b0c87bf14f289413ec668a39063ef10a557cc2c45ca08e52a7b1714a1f9f69763edf3a7faa1d01c'
            '04d46a8b3ffe459ff19e94a2545f1e7b2cca336d3a3688b7aefbafbfe341301009cf61b59c1901629bbc9919e0a5e0462fb3346d5b72d3264b03e9175fa54c5a'
            'e3cb1b072754ae6443fa136fffa263761b5e4e3da5dca1e91b7c4d577daaf01afa0affde04f1355fc404fcd336852db4ce8dc57938833f864346a0b17c12d6d6')

prepare() {
  # link up directory
  ln -sf BambuStudio-${pkgver} BambuStudio
  # fix broken udev install reference
  patch -p0 < "$srcdir/CMakeLists.txt.patch"
  # add missing 0001-Boost-fix.patch
  cp 0001-Boost-fix.patch BambuStudio/deps/Boost
  # remove invalid UTF-8 chars
#  patch -p0 < "$srcdir/TreeSupport.cpp.patch"
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
