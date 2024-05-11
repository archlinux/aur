# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-midi-mg
pkgver=3.0.3
pkgrel=1
epoch=1
pkgdesc="Allows MIDI devices to interact with OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-midi-mg.1570/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake" "git")
options=('debug')
source=(
  "$pkgname::git+https://github.com/nhielost/$pkgname.git#tag=$pkgver"
  "libremidi::git+https://github.com/jcelerier/libremidi.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
)

prepare() {
  cd $pkgname

  git config submodule.libremidi.url $srcdir/libremidi
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DENABLE_FRONTEND_API=ON \
  -DENABLE_QT=ON \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations -Wno-error=type-limits -Wno-error=shadow -Wno-error=conversion -Wno-error=float-conversion -Wno-error=unused-parameter" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
