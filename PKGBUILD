# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="bambustudio"
#pkgver=01.06.02.04
pkgver=01.07.04.52
pkgrel=2
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
  'https://raw.githubusercontent.com/bambulab/BambuStudio/master/deps/Boost/0001-Boost-fix.patch'
  'BambuStudio.cpp.patch'
  'TreeSupport.cpp.patch'
  'bambu-studio.sh'
  'clipper.engine.h'
  'TBB.cmake'
  '0001-TBB-GCC13.patch'
  'OpenEXR.cmake'
  '0001-OpenEXR-GCC13.patch'
  'clipper.engine.cpp'
  'CMakeLists.txt.patch'
  )
sha512sums=('6dba4914b56dd931e50371a759f61afb88593a49c1b93f551cf883862df9c54b8958783d3cc24a7a36817b3e6a0516c79a8f7b3f329fd18598000f19f366afaf'
            'fd0c5df8bd82ad8fb96204921a407a4497406bc0d0b13ab11d241d28b6b924baf1d9557974506a8135f6c58ba0b183c6828a63b8b625edc1654484b3630af775'
            '419e7ffb8044531a1c78cd191a96c11f719b439afce674f7e31d1d2e0dc57ecc03cea27ab4ad5ee6522606630fd59ac1745b9a1b787db14893561a4495806117'
            '674fc00a73b2e5997e5f3dcf74299a2ab5dfac5114247f8b6b0c87bf14f289413ec668a39063ef10a557cc2c45ca08e52a7b1714a1f9f69763edf3a7faa1d01c'
            'e3cb1b072754ae6443fa136fffa263761b5e4e3da5dca1e91b7c4d577daaf01afa0affde04f1355fc404fcd336852db4ce8dc57938833f864346a0b17c12d6d6'
            '183dcf3298432904b4fc0098bb356be6b87f703fd189eb66e7da8c39eacd4e7620ec153b2ab3746a777c887dffbd4440bc1cd1977f397044ed330598ce98e0e9'
            '208a24cd44521907a261a5fa0a646eb469099bbe1b96805070e09cc1f288d7b8ff7d79dfd153e08f1ce5894030f87e5d89f33cfadfab8f2454f07d5495d360f1'
            '929fec4b32e05cf88f335adc74dff0cb7e353054674d22f67b5dbe6e1a741de758c53ddeb746a2c2f2ffe7351eb0985f66c15d562069e6fedc7443163eee2171'
            'fcc49f8364b9446b34e0b96c72e5e4ff0288d2ebbdef8f38f8a488f97558133d0c826de1b7181e1484135e6a9e3b549b6c5fd66d37d8f3b13751b03a675d4e41'
            'b32b2b1d7320ddac22eb081a7d96f75b37cb8fc84d716433ab9e08143390c3f074cfecdaf81f74621bcd9e15def2451d673e7b1600c75fa7edf62736aaf9e315'
            'bb206ceefb7da698db8ce52531a865b2b1b2478431fc21307fa40300dda5c081b396f9667392fa677e8a7681682cd82812e6fa2c3f25f9ba5dc758b055d38900'
            '04d46a8b3ffe459ff19e94a2545f1e7b2cca336d3a3688b7aefbafbfe341301009cf61b59c1901629bbc9919e0a5e0462fb3346d5b72d3264b03e9175fa54c5a')

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
