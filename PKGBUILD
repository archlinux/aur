# Maintainer: EricWRogers <ericwilliamrogers@gmail.com>
pkgname=canispack-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Project launcher for the Canis engine'
arch=('x86_64')
url='https://github.com/EricWRogers/CanisPack'
license=('MIT')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxcb')
makedepends=('cmake' 'git' 'ninja')
provides=('canispack')
conflicts=('canispack')
source=(
  'CanisPack::git+https://github.com/EricWRogers/CanisPack.git'
  'canis::git+https://github.com/EricWRogers/canis.git'
  'SDL::git+https://github.com/libsdl-org/SDL.git'
  'imgui::git+https://github.com/ocornut/imgui.git'
  'yaml-cpp::git+https://github.com/jbeder/yaml-cpp.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/CanisPack"
  git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd "$srcdir/CanisPack"

  git submodule init
  git config submodule.vendor/canis.url "$srcdir/canis"
  git config submodule.vendor/SDL.url "$srcdir/SDL"
  git config submodule.vendor/imgui.url "$srcdir/imgui"
  git config submodule.vendor/yaml-cpp.url "$srcdir/yaml-cpp"
  git -c protocol.file.allow=always submodule update --init vendor/canis vendor/SDL vendor/imgui vendor/yaml-cpp
}

build() {
  cmake -S "$srcdir/CanisPack" -B "$srcdir/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  install -Dm644 "$srcdir/CanisPack/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
