# Contributor: Adam Goldsmith <contact@adamgoldsmith.name>
pkgname=libarcus-git
pkgver=r402.6cc4cec
pkgrel=1
pkgdesc="A library designed to facilitate the communication between Cura and its backend and similar code."
arch=('i686' 'x86_64')
url="https://github.com/Ultimaker/libArcus"
license=('GPL2')
provides=('arcus' 'libarcus')
conflicts=('arcus' 'libarcus')
depends=(
  'protobuf'
  'python'
)
makedepends=(
  'cmake'
  'conan'
  'cura'
  'git'
  'ninja'
  'python-virtualenv'
)
source=('git+https://github.com/Ultimaker/libArcus.git'
        'git+https://github.com/ultimaker/conan-config.git')
b2sums=('SKIP'
        'SKIP')

prepare() {
  cd libArcus
  conan config install ../conan-config
  conan profile detect --force
  conan remote remove cura # as the JFrog artifact is behind loginwall, so cura needs to be in makedepends instead

  conan install . --build=missing --update
}

pkgver() {
  cd libArcus
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p libArcus/build
  cd libArcus/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  cmake --build .
}

package() {
  cd "$srcdir/libArcus/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
