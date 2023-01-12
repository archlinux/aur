# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-midi
_pkgver=0.9.3-ALPHA-3.66
pkgver=${_pkgver//-/_}
pkgrel=5
pkgdesc="An automated scene switcher for OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-midi.1023/"
license=("GPL2")
depends=("obs-studio<28" "jack")
makedepends=("cmake" "git")
options=('debug')
source=(
  "$pkgname::git+https://github.com/cpyarger/$pkgname.git#tag=tag-$_pkgver"
  "libremidi::git+https://github.com/jcelerier/libremidi.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
)

prepare() {
  cd $pkgname

  git config submodule.src/libremidi.url $srcdir/libremidi
  git -c protocol.file.allow=always submodule updategit submodule update

  # Use system libobs finder
  rm -f external/FindLibObs.cmake

  # Add missing quotes
  sed -i 's/elseif(${LSB_RELEASE_ID_SHORT} STREQUAL "Ubuntu")/elseif("${LSB_RELEASE_ID_SHORT}" STREQUAL "Ubuntu")/g' CMakeLists.txt
}

build() {
  cd $pkgname

  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr'

  make -C build
}

package() {
  cd $pkgname

  make -C build DESTDIR="$pkgdir/" install

  # Remove libremidi cmake finders
  rm -rf "$pkgdir"/usr/lib/cmake
}
