# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="bambustudio"
pkgver=01.04.00.17
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
  'BambuStudio.cpp.patch'
  'TreeSupport.cpp.patch'
  'CMakeLists.txt.patch'
  'bambu-studio.sh'
  )
sha512sums=('f4ef1212163e11373eca317eafafcc324a5fdb41a8cba3da17fb166bbea1a27a55a8aa1f3810648131c1235b681f8b1e8c8cf784bccf144620a67fe467f77689'
            '419e7ffb8044531a1c78cd191a96c11f719b439afce674f7e31d1d2e0dc57ecc03cea27ab4ad5ee6522606630fd59ac1745b9a1b787db14893561a4495806117'
            '674fc00a73b2e5997e5f3dcf74299a2ab5dfac5114247f8b6b0c87bf14f289413ec668a39063ef10a557cc2c45ca08e52a7b1714a1f9f69763edf3a7faa1d01c'
            'd9161e40ceee4d9600ed5c1b76db0080b5e70425877adcf13603f7bcdea17f2149d9444b458e023db93f758d078b47cca91af6878d104c690ffe389ec01e84a7'
            'e3cb1b072754ae6443fa136fffa263761b5e4e3da5dca1e91b7c4d577daaf01afa0affde04f1355fc404fcd336852db4ce8dc57938833f864346a0b17c12d6d6')

prepare() {
  # link up directory
  ln -sf BambuStudio-${pkgver} BambuStudio
  # fix broken udev install reference
  patch -p0 < "$srcdir/CMakeLists.txt.patch"
  # remove invalid UTF-8 chars
  patch -p0 < "$srcdir/TreeSupport.cpp.patch"
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
