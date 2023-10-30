# Maintainer: shizhiex <shizhiex@gmail.com>

pkgname="orca-slicer"
pkgver=1.8.0beta
_tag='1.8.0-beta'
pkgrel=1
pkgdesc="Orca Slicer is a fork of Bambu Studio. It was previously known as BambuStudio-SoftFever"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'ttf-harmonyos-sans')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'm4' 'pkgconf')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=(
  "https://github.com/SoftFever/OrcaSlicer/archive/refs/tags/v${_tag}.tar.gz"
  "https://raw.githubusercontent.com/SoftFever/OrcaSlicer/v${_tag}/deps/Boost/0001-Boost-fix.patch"
  'orca-slicer.sh'
  )
sha256sums=('dbc8238f722947645e66b352a9b502f37989de15be578903147f5561a6693d92'
            'bb2662d0a4c58c43726ec98ef4acf201fcf98719c9bbfd207e2d6cdf695a2093'
            '30d860958f3fd5fc657daa6addce45e91689d9833b931c9feb646da760d61de8'
            )

prepare() {
  # link up directory
  ln -sf OrcaSlicer-${_tag} OrcaSlicer
  # add missing 0001-Boost-fix.patch
  cp 0001-Boost-fix.patch OrcaSlicer/deps/Boost
}

build() {
  # deps
  cd "$srcdir/OrcaSlicer/deps"
  for dir in build deps; do
    test -d $dir || mkdir $dir
  done
  cd build
  if [ ! -f $srcdir/.deps_done ]; then
    cmake ../ -DDESTDIR="$srcdir/dep_linux" -DCMAKE_BUILD_TYPE=Release -DDEP_WX_GTK3=1 -DJPEG_VERSION=8
    { test "$(nproc --ignore 4)" -gt 1 && make -j"$(nproc --ignore 4)" ;} || make
  fi
  touch $srcdir/.deps_done

  # bins
  cd "$srcdir/OrcaSlicer"
  for dir in build install_dir; do
    test -d $dir || mkdir $dir
  done
  cd build
  cmake .. -DSLIC3R_FHS=1 -DSLIC3R_STATIC=ON -DSLIC3R_GTK=3 -DBBL_RELEASE_TO_PUBLIC=1 -DCMAKE_PREFIX_PATH="$srcdir/dep_linux/usr/local" -DCMAKE_INSTALL_PREFIX="$srcdir/install_dir"
  { test "$(nproc --ignore 4)" -gt 1 && cmake --build . --target install --config Release -j"$(nproc --ignore 4)" ;} || cmake --build . --target install --config Release
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
