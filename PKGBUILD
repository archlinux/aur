# Maintainer: shizhiex <shizhiex@gmail.com>

pkgname="orca-slicer"
pkgver=1.6.2
_tag='1.6.2-beta'
pkgrel=1
pkgdesc="Orca Slicer is a fork of Bambu Studio. It was previously known as BambuStudio-SoftFever"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPLv3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'harmonyos-sans-git')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'm4' 'pkgconf')
provides=("OrcaSlicer")
conflicts=("OrcaSlicer")
source=(
  "https://github.com/SoftFever/OrcaSlicer/archive/refs/tags/v${_tag}.tar.gz"
  "https://raw.githubusercontent.com/SoftFever/OrcaSlicer/v${_tag}/deps/Boost/0001-Boost-fix.patch"
  'CMakeLists.txt.patch'
  'OrcaSlicer.desktop.patch'
  'orca-slicer.sh'
  )
sha256sums=('e084d402cd16e9a774048c5093c4cba7b95d9f5023dc61fbcde1547386c6f6af'
            'bb2662d0a4c58c43726ec98ef4acf201fcf98719c9bbfd207e2d6cdf695a2093'
            'f2b56d64bc5d80cf726ab0a4931ecf84cdaa938bb6da6134d36e6a05d3a0eee4'
            '030d32a60c7bbecacaf1f3844ed6157c1eb1d67b7009a8132e91b0a07deb77c0'
            '30d860958f3fd5fc657daa6addce45e91689d9833b931c9feb646da760d61de8'
            )

prepare() {
  # link up directory
  ln -sf OrcaSlicer-${_tag} OrcaSlicer
  # fix broken udev install reference
  patch -p0 < "$srcdir/CMakeLists.txt.patch"
  # add missing 0001-Boost-fix.patch
  cp 0001-Boost-fix.patch OrcaSlicer/deps/Boost
  # icons conflict with BambuStudio
  patch -p0 < "$srcdir/OrcaSlicer.desktop.patch"
}

build() {
  # deps
  cd "$srcdir/OrcaSlicer/deps"
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
  cd "$srcdir/OrcaSlicer"
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
  install "orca-slicer" "$pkgdir/usr/bin/orca-slicer-bin"
  install "$srcdir/orca-slicer.sh" "$pkgdir/usr/bin/orca-slicer"

  echo "Entering directory $srcdir/OrcaSlicer/install_dir."
  cd "$srcdir/install_dir"
  find share -type f -exec install -D {} "$pkgdir/usr/{}" \;

  echo "Entering directory $srcdir/OrcaSlicer/doc."
  cd "$srcdir/OrcaSlicer/doc"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
