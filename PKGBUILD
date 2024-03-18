# Maintainer: Nathan Ollerenshaw <chrome@stupendous.net>

pkgname=smoothpaper
pkgdesc="A wallpaper changer daemon for X11 Window Mangers with smooth transitions between wallpapers."
pkgver=1.0.1
pkgrel=1
url=https://github.com/matjam/smoothpaper
arch=(x86_64)
depends=('libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxext')
makedepends=('cmake' 'make' 'base-devel' 'ninja' 'gcc' 'git' 'zip' 'unzip')

source=(https://github.com/matjam/smoothpaper/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('5dbbff6acedbaa241d64bd660ba1b5358a1a24181cfddb97547da6b35467be23')

build() {
export VCPKG_DISABLE_METRICS=1
cd $pkgname-$pkgver

if [ ! -d "vcpkg" ]; then
  git clone https://github.com/microsoft/vcpkg
fi

./vcpkg/bootstrap-vcpkg.sh
mkdir -p build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_MAKE_PROGRAM=make --preset=RELEASE
mkdir -p RELEASE
cd RELEASE
make
}

package() {
mkdir -p $pkgdir/usr/bin
cp $pkgname-$pkgver/build/RELEASE/smoothpaper $pkgdir/usr/bin
mkdir -p $pkgdir/etc/xdg/smoothpaper
cp $pkgname-$pkgver/smoothpaper.toml $pkgdir/etc/xdg/smoothpaper
}
