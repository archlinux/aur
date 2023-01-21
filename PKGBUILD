# Maintainer: lrobbins at silktown dot software
pkgname=rigelengine-git
pkgver=0.9.1.r4.g011976b3
pkgrel=2
# Description taken from desktop file
pkgdesc='A modern re-implementation of the classic DOS game Duke Nukem II'
url='https://github.com/lethal-guitar/RigelEngine'
arch=('x86_64')
license=('GPL2')
depends=(sdl2_mixer)
makedepends=(git cmake sdl2)
source=("git+https://github.com/lethal-guitar/RigelEngine")
sha256sums=('SKIP')
_executable_name=RigelEngine
_source_dir="RigelEngine"

pkgver() {
  cd "$_source_dir"
  git describe --long --tag | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_source_dir"
    git submodule update --init --recursive
}

build() {
    cd "$_source_dir"
    mkdir -p build 
    cd build
    cmake .. -Wno-dev -DBUILD_TESTS=ON
    make -j$(nproc)
}

package() {
    cd "$_source_dir"
    mkdir -p "$pkgdir/usr/bin"
    cp "build/src/$_executable_name" "$pkgdir/usr/bin"

    # copy over the destop file from the dist directory
    mkdir -p "$pkgdir/usr/share/applications"
    cp dist/linux/rigelengine.desktop "$pkgdir/usr/share/applications"

    # copy over the icons from the dist directory
    mkdir -p "$pkgdir/usr/share/icons"
    cp dist/linux/rigelengine_128.png "$pkgdir/usr/share/icons"

    # add icon path to the desktop entry
    echo Icon=/usr/share/icons/rigelengine_128.png >> "$pkgdir/usr/share/applications/rigelengine.desktop"
}

check() {
    cd "$_source_dir"
    ctest --test-dir build --output-on-failure
}
